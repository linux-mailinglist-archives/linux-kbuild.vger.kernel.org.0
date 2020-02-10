Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35BBB156E99
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2020 06:15:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgBJFPE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 10 Feb 2020 00:15:04 -0500
Received: from ozlabs.org ([203.11.71.1]:53503 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726103AbgBJFPE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Feb 2020 00:15:04 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48GDcQ0QD1z9sRh;
        Mon, 10 Feb 2020 16:15:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1581311702;
        bh=yzhpv6cmYCssx98FCBFW0NRxmjLDSaHLcTLAs/tkAiw=;
        h=From:To:Cc:Subject:Date:From;
        b=E4Fhbwnpy8Je0T0muvYIi74Ntr5CJ40lNmhsZmH8iYN6/ySF8IncCnbO4oDwNsH7b
         6pOG5iXd4pxacmh7I6cHkPI1rWeH3Ox8jrYkHOePL434X/HLn/lkM3T9SfCWNFxdGp
         aqHxTjO3hV6TcKUZdZRnYmcbv3D87xcfEHfVJYe8+/B412FUO4m8ar8wFdSzqK6duE
         XP+lfE+15rCNh24XvNIvdRJWAI2fMEoI6HVq5w3YxUWzmUvD/lpYngWWK/MHGsM1oc
         zAoAFcqoo+3qGgfb1nRNZO1RpvS4kY8e0ElH99T4UNZSW+DDLLOVk0QKPljb1bDGQm
         qA5TNMsMN9wfw==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: install is no longer PHONY?
Date:   Mon, 10 Feb 2020 16:14:58 +1100
Message-ID: <874kvz10rx.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,

I noticed that "install" seems to be no longer PHONY, or at least if I
have a file/directory called install then the build doesn't run.

eg:
  $ touch install
  $ make install
  make: 'install' is up to date.
  $ rm install
  $ make install
    LDS     arch/powerpc/boot/zImage.lds
    WRAP    arch/powerpc/boot/zImage.pseries
    WRAP    arch/powerpc/boot/zImage.epapr

In the past the presence of an install file/directory didn't have any
affect.

It seems this changed in:
  d79424137a73 ("kbuild: do not update config when running install targets")

Was that expected?

cheers
