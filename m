Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF0C47B12D
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Dec 2021 17:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238533AbhLTQhT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Dec 2021 11:37:19 -0500
Received: from smtpout140.security-mail.net ([85.31.212.145]:48553 "EHLO
        fx405.security-mail.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S238502AbhLTQhT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Dec 2021 11:37:19 -0500
Received: from localhost (localhost [127.0.0.1])
        by fx405.security-mail.net (Postfix) with ESMTP id 5062D323929
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Dec 2021 17:29:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
        s=sec-sig-email; t=1640017771;
        bh=+RmLMtxX7FEN4IP7pR/HhRRUDtp+lqKsB5xfR+wF64I=;
        h=From:To:Cc:Subject:Date;
        b=vfAkcw+nldrsgjJZ5/wE/0Bxp2voIMzThXZY5Ldf38SM5TfqTLlB1GwSAxo9nj67u
         Pa7uKMFkKvQHU9esNMIuznWliO6pNeDw86mhPc/Ddi7xLoijghM00X64jVBALDqksd
         BOyRUn+VgGxLpnXUyied2oVA2ogZ5rEue1SDVJ+Q=
Received: from fx405 (localhost [127.0.0.1])
        by fx405.security-mail.net (Postfix) with ESMTP id D5985323924;
        Mon, 20 Dec 2021 17:29:30 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <7ebe.61c0af6a.9a7cb.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
        by fx405.security-mail.net (Postfix) with ESMTPS id 9BC8132391A;
        Mon, 20 Dec 2021 17:29:30 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTPS id 7F4AE27E03B2;
        Mon, 20 Dec 2021 17:29:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 6888D27E03C3;
        Mon, 20 Dec 2021 17:29:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 6888D27E03C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1640017770;
        bh=WbRuSIXCPsRLvTvUsXmCiMuFeokonVum93L3sosHuvk=;
        h=From:To:Date:Message-Id;
        b=fgTU/b8i0nkxl9bmgNo/plv4DQhHuSbOYE98UNNycVl+y9Wbo18JEYCb1tXmn/8gQ
         BO8NDTDh+xubvisNkX7/RrAzPQhepRakF77FJJwcpsCRXUqhXYN+5HnC3dxlwx8K3o
         X5XVCnoi6OFGEWH1iTvjO+qeQ1DFss4U5jdq3xFo=
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id GiLzh3VgZV6S; Mon, 20 Dec 2021 17:29:30 +0100 (CET)
Received: from junon.lin.mbt.kalray.eu (unknown [192.168.37.161])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 4FACD27E03B2;
        Mon, 20 Dec 2021 17:29:30 +0100 (CET)
From:   Yann Sionneau <ysionneau@kalray.eu>
To:     linux-kbuild@vger.kernel.org
Cc:     ysionneau@kalray.eu, robh@kernel.org
Subject: [PATCH 0/1] Use target CPP to pre-process dts as supported flag checks are done on target toolchain
Date:   Mon, 20 Dec 2021 17:29:24 +0100
Message-Id: <20211220162925.14441-1-ysionneau@kalray.eu>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: by Secumail
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello, 

I have encountered an issue with the following setup: 
* host toolchain gcc 7.5.0 (Ubuntu 18.04 LTS)
* target toolchain gcc 9.4.1

In this case I got build error while compiling DTBs because of the following flag: -fmacro-prefix-map
This flag was known to my target toolchain (CC) but not by my HOSTCC.
One might say that Ubuntu 18.04 is pretty old and I should upgrade but I think it's fundamentally broken to check flags on toolchain A and use them on toolchain B. We could have other issues like this in the future.
I'm proposing this change to open the discussion.
Regards, 

Yann Sionneau (1):
  Use target CPP to pre-process dts as supported flag checks are done on
    target toolchain

 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.17.1

