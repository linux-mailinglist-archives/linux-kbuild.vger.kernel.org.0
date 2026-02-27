Return-Path: <linux-kbuild+bounces-11467-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIYuCdQ7oWnqrQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11467-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 07:38:12 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C26C51B34BF
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 07:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5140F3042242
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Feb 2026 06:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE03364954;
	Fri, 27 Feb 2026 06:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="OuK/m4sw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4868265298;
	Fri, 27 Feb 2026 06:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174286; cv=none; b=bgDr8PrXk08IVctPPrHEFZZYEh/esZF7iggAWTDhad77nnOR/z+j0wVl70Ueuq6yGGE6/Dxkp+BY7qhMd1t/skyDn7zoVgwzfRFVR/yCBbHi1cfbwQYrS3WTaphmAr68VJkaGmlZSXMZbQynOYTR4kYGxLGVUME9FdSu/Qa0fGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174286; c=relaxed/simple;
	bh=usB6bXx3SPjQxGImjMdnt4YmHXfpd/eowhO9I68yKC8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DAgjfEJRENPrXZNoXgYofHqaHy5r0FKR4cEum8PFNdzlFuvpQDLVAf8HHEbVabf9YgXl88B6wIX9SYRbvbWw8IovAuZ2YB2kIz7MFoPddMgTeB4l0Rrih3fhBXFfxrylD5HmMgmR5ccnHwoEzSHW9k/Jae7ie2IwJ8A7iUvuP5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=OuK/m4sw; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772174282;
	bh=usB6bXx3SPjQxGImjMdnt4YmHXfpd/eowhO9I68yKC8=;
	h=From:Subject:Date:To:Cc:From;
	b=OuK/m4swP1KkjD6q8Is8QPgMe+B/DciXyQygeQpGTE8msywPBmYWe38rMWsfZeynL
	 I3O+/EjWUDe/NVN4tLSkfoEDULSl9H1CwJxsKztNVNd1zR8zoRisF+wd3H1rAVEhDW
	 Dkhs79Ly5E8nlA5QIt0LkTha5fQ4/n92IIp1Xi1M=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/9] kbuild: uapi: remove usage of toolchain headers
Date: Fri, 27 Feb 2026 07:37:58 +0100
Message-Id: <20260227-kbuild-uapi-libc-v1-0-c17de0d19776@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBtIKbGuEi1MpxoSC6UIwrsnL
 d/i/xcSRaYEQ/VCpJsTH6FA1BXYzYSVkF0xyEaqRsgW9/li7/AyJ6Pn2aLu1SI6abVwCkp2Rlr
 4+ZfjlPMHSeJLpWIAAAA=
X-Change-ID: 20260124-kbuild-uapi-libc-896f152c81d6
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Brian Cain <bcain@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, linux-hexagon@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174282; l=1956;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=usB6bXx3SPjQxGImjMdnt4YmHXfpd/eowhO9I68yKC8=;
 b=rwAt58s2AmLrtBQSAoYYnNs4OYyK08fOW45mAnWNW7C7L2mW5BTg3u9Tw3PHccPi5LxmvX5Y5
 0alsPoZNdvBAUxAIpru76X/VS5aTnbllrZ7HZX9N72QvPscMHDG67Q+
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11467-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,weissschuh.net:mid,weissschuh.net:dkim,weissschuh.net:email]
X-Rspamd-Queue-Id: C26C51B34BF
X-Rspamd-Action: no action

Currently the test compilation of some UAPI headers requires a toolchain
libc headers. Remove that dependency.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (9):
      hexagon: uapi: Fix structure alignment attribute
      kbuild: uapi: test linux/bpf_perf_event.h on powerpc
      kbuild: uapi: deduplicate linux/bpf_perf_event.h exclusions
      kbuild: uapi: completely exclude linux/bpf_perf_event.h on nios2
      kbuild: uapi: only use dummy-include for headers which use libc
      kbuild: uapi: provide stub includes for some libc headers
      kbuild: uapi: use custom stub headers instead of libc ones
      kbuild: uapi: simplify libc dependency logic
      kbuild: uapi: remove now unneeded guard headers

 arch/hexagon/include/uapi/asm/sigcontext.h |  2 +-
 usr/dummy-include/endian.h                 |  0
 usr/dummy-include/limits.h                 |  8 ++++++++
 usr/dummy-include/netinet/if_ether.h       |  0
 usr/dummy-include/netinet/in.h             |  0
 usr/dummy-include/stdbool.h                |  7 -------
 usr/dummy-include/stddef.h                 |  8 ++++++++
 usr/dummy-include/stdint.h                 | 17 +++++++++++++++++
 usr/dummy-include/stdlib.h                 |  7 -------
 usr/dummy-include/string.h                 | 12 ++++++++++++
 usr/dummy-include/sys/ioctl.h              |  0
 usr/dummy-include/sys/socket.h             | 12 ++++++++++++
 usr/dummy-include/sys/time.h               |  3 +++
 usr/dummy-include/sys/types.h              |  0
 usr/dummy-include/time.h                   |  0
 usr/dummy-include/unistd.h                 |  0
 usr/include/Makefile                       | 24 +++++-------------------
 17 files changed, 66 insertions(+), 34 deletions(-)
---
base-commit: 93e7204d4b0e7b69ebbceee0dc09092e975cece3
change-id: 20260124-kbuild-uapi-libc-896f152c81d6

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


