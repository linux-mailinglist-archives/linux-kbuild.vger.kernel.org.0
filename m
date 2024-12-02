Return-Path: <linux-kbuild+bounces-4944-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5EB9E0CFC
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 21:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 622BC165007
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 20:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D621DE3BE;
	Mon,  2 Dec 2024 20:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="dqAPfq5D";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="dqAPfq5D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83436AAD;
	Mon,  2 Dec 2024 20:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733171261; cv=none; b=RfkFUrdeSBqIqa8viD9nUzfDHiFUg3ZRFUwx92xU2+nobzKre8QdXY5H+OsRTd7L0jzo3AHsS2RzrIO4ylmouXuQtEGAIliOPkCaxukpxs1AN8nCFqjodiCOVI27f/177XH6DmrAfGWzw6bRAtLCQxA92muIkkEy2LlaTNOFsok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733171261; c=relaxed/simple;
	bh=LAsH30HjyJQrUzkQ1khwv/whmLNUuQEjnxMaRCEjDII=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=Fw8/eSuEmGZNmNgcqpDrKmcNEBTHvRQCUpqON5rTJ2UU65lbWdLRpD/Y0ALrAqWjHnZ76hby0sjsb1XRTZU3aMXw03TdH/vtbjtbMUFTF/gae6FTomHaJq3pd2rcEltCfL/bKp3wSOMR31WUyLS4ARFjz/D4r/x/G3a+trEhBrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=dqAPfq5D; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=dqAPfq5D; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1733171258;
	bh=LAsH30HjyJQrUzkQ1khwv/whmLNUuQEjnxMaRCEjDII=;
	h=Message-ID:Subject:From:To:Date:From;
	b=dqAPfq5DMDW7PHVkwu9KK/EOOQOKAvSRBvFgC8NlCmYMNVWY/+SKSaW046r87+aIP
	 A4dEd/0hQski10NKcP2LlcLqJOdf4fanDO2etcukfJZUle2qGtP8k68Y9wFK0zFhaI
	 edMQenp45qGd81Z2qUsFe/hvV/G0J0B/lWRNJuLk=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id A4CBF1286901;
	Mon, 02 Dec 2024 15:27:38 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id FcXxQgDL0rRV; Mon,  2 Dec 2024 15:27:38 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1733171258;
	bh=LAsH30HjyJQrUzkQ1khwv/whmLNUuQEjnxMaRCEjDII=;
	h=Message-ID:Subject:From:To:Date:From;
	b=dqAPfq5DMDW7PHVkwu9KK/EOOQOKAvSRBvFgC8NlCmYMNVWY/+SKSaW046r87+aIP
	 A4dEd/0hQski10NKcP2LlcLqJOdf4fanDO2etcukfJZUle2qGtP8k68Y9wFK0zFhaI
	 edMQenp45qGd81Z2qUsFe/hvV/G0J0B/lWRNJuLk=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 080991286824;
	Mon, 02 Dec 2024 15:27:37 -0500 (EST)
Message-ID: <81560af7526138aa5221e5900ee7462f55bb090d.camel@HansenPartnership.com>
Subject: section mismatch error in aesgcm causing a build failure
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: linux-crypto@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 02 Dec 2024 15:27:36 -0500
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I'm getting this in 6.13-rc1:

/home/jejb/git/linux-tpm/lib/crypto/aesgcm.c:212:29: error: ptext1
causes a section type conflict with aesgcm_tv
 static const u8 __initconst ptext1[16];
                             ^~~~~~
/home/jejb/git/linux-tpm/lib/crypto/aesgcm.c:570:9: note: ‘aesgcm_tv’ was declared here
 } const aesgcm_tv[] __initconst = {
         ^~~~~~~~~
make[5]: *** [/home/jejb/git/linux-tpm/scripts/Makefile.build:194: lib/crypto/aesgcm.o] Error 1
/home/jejb/git/linux-tpm/lib/crypto/aesgcm.c:212:29: error: ptext1 causes a section type conflict with aesgcm_tv
 static const u8 __initconst ptext1[16];
                             ^~~~~~
/home/jejb/git/linux-tpm/lib/crypto/aesgcm.c:570:9: note: ‘aesgcm_tv’ was declared here
 } const aesgcm_tv[] __initconst = {
         ^~~~~~~~~
make[5]: *** [/home/jejb/git/linux-tpm/scripts/Makefile.build:194: lib/crypto/aesgcm.o] Error 1

I think it's way older than 6.13-rc1, but the inclusion of the sevguest
driver in the merge window now means that something actually selects
it.  I can fix it simply by adding a zero initialization to the file:

-static const u8 __initconst ptext1[16];
+static const u8 __initconst ptext1[16] = { 0 };

Which I think means that by default the traditional zero initialization
of a static variable is in the wrong section (and actually likely is
wrong for all our __initX variables as well).

In case it matters, this is with gcc-7

Regards,

James


