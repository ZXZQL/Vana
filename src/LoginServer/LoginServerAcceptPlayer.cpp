/*
Copyright (C) 2008 Vana Development Team

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; version 2
of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
*/
#include "LoginServerAcceptPlayer.h"
#include "LoginServerAcceptHandler.h"
#include "LoginServer.h"
#include "InterHeader.h"
#include "Worlds.h"
#include "ReadPacket.h"

void LoginServerAcceptPlayer::realHandleRequest(ReadPacket *packet) {
	if (!processAuth(packet, LoginServer::Instance()->getInterPassword())) return;
	switch(packet->getShort()) {
		case INTER_REGISTER_CHANNEL: LoginServerAcceptHandler::registerChannel(this, packet); break;
		case INTER_UPDATE_CHANNEL_POP: LoginServerAcceptHandler::updateChannelPop(this, packet); break;
		case INTER_REMOVE_CHANNEL: LoginServerAcceptHandler::removeChannel(this, packet); break;
	}
}

void LoginServerAcceptPlayer::authenticated(char type) {
	if (type == INTER_WORLD_SERVER)
		Worlds::connectWorldServer(this);
	else if (type == INTER_CHANNEL_SERVER)
		Worlds::connectChannelServer(this);
	else
		disconnect();
}
