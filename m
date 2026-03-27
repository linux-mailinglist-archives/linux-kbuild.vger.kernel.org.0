Return-Path: <linux-kbuild+bounces-12320-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NZSHJj3xmlvQwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12320-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 22:33:12 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF9234BB8E
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 22:33:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F6743014FF6
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 21:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41E830C35C;
	Fri, 27 Mar 2026 21:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="l60CPaZt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B64629DB88;
	Fri, 27 Mar 2026 21:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774647155; cv=none; b=rr3Ge/TS5V4+e2kZW4tpMqgUfvJEO5FEpzdp9J++FhyfH/SAlsyDzNSSstsOYHM2pUQlyl2iW5Ue8SL+Xu+zUyVxOe2MY68TxcCju9Edsdy/GI10So4MTfvhA6Mf+Rht/EZJXqVYKfGUjM0gzGWsPqRzcI+St/4VBWyynlU7YTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774647155; c=relaxed/simple;
	bh=BU6WtRaB4EK015vA4CNY7IvPCX00apu11HOfXO6nOJM=;
	h=Date:From:To:Subject:Message-Id:Mime-Version:Content-Type; b=FxnjIfGa4ITJrHs+Ey59O0aSoQyWUst4nD+bVLRu2E7dJ1wXk+RQLg4sKBa29FRxWKCES/L+zBI+gW1waMP4zvd4OovsKUe1U4+4ZALnlHT4nYj0/BXTEBCjQRmkxMPbfcnG8L3ublz03DP7oOj9hVbZc2JexOQfQQSe4sdp7GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=l60CPaZt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18621C19423;
	Fri, 27 Mar 2026 21:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774647155;
	bh=BU6WtRaB4EK015vA4CNY7IvPCX00apu11HOfXO6nOJM=;
	h=Date:From:To:Subject:From;
	b=l60CPaZtQQF443xDq5nNkByM0LnHTYpdEvWGpCaAOkuJ8Uo1eSUOFspCCbPiHYdVB
	 yfNaFe70BjUmfP/W9ZfBYscE2C0R3P6qINxQ5HTr/7QlfuQAb0/40yTmL+wrhha9ny
	 gE+qNsya6V6tbeuwzJZytMkWljXzd03NmlwFKCQU=
Date: Fri, 27 Mar 2026 14:32:34 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: tools/testing/selftests
Message-Id: <20260327143234.40bb8a0119bd55670ddfeec6@linux-foundation.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12320-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[linux-foundation.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:dkim,linux-foundation.org:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0CF9234BB8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


whinges, perrmanits, maybe I'm doing it wrong, etc.

a)

At the top-level, neither `make mrproper' nor `make clean' remove the
executables from tools/testing/selftests/mm/.  Seems wrong?

b)

Shouldn't I be able to run

	make selftests

from the top level?

c)

tools/testing/selftests/mm
make clean
make

does:

  CC       droppable
  CC       guard-regions
  CC       merge
  CC       rmap
  CC       soft-dirty
gcc -Wall -O2 -I /usr/src/25/tools/testing/selftests/../../..  -isystem /usr/src/25/tools/testing/selftests/../../../usr/include -isystem /usr/src/25/tools/testing/selftests/../../../tools/include/uapi -Wunreachable-code -U_FORTIFY_SOURCE -no-pie -D_GNU_SOURCE= -I/usr/src/25/tools/testing/selftests/../../../tools/testing/selftests  -m32 -mxsave  protection_keys.c vm_util.c thp_settings.c pkey_util.c -lrt -lpthread -lm -lrt -ldl -lm -o /usr/src/25/tools/testing/selftests/mm/protection_keys_32
gcc -Wall -O2 -I /usr/src/25/tools/testing/selftests/../../..  -isystem /usr/src/25/tools/testing/selftests/../../../usr/include -isystem /usr/src/25/tools/testing/selftests/../../../tools/include/uapi -Wunreachable-code -U_FORTIFY_SOURCE -no-pie -D_GNU_SOURCE= -I/usr/src/25/tools/testing/selftests/../../../tools/testing/selftests  -m32 -mxsave  pkey_sighandler_tests.c vm_util.c thp_settings.c pkey_util.c -lrt -lpthread -lm -lrt -ldl -lm -o /usr/src/25/tools/testing/selftests/mm/pkey_sighandler_tests_32

why did it start emitting the gcc command lines?

d) within tools/testing/selftests/mm:

	make clean
	make -j100

   compiles 3-4 things then ends.

   A subsequent `make -j1' compiles nothing.

   Whereas

	make clean
	make -j1

   compiles everything.  Slowly.

Thanks.   

