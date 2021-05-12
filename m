Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 070A037BFDF
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 May 2021 16:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230481AbhELOY7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 May 2021 10:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230452AbhELOY6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 May 2021 10:24:58 -0400
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 105B3C061574;
        Wed, 12 May 2021 07:23:50 -0700 (PDT)
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94.2)
        (envelope-from <johannes@sipsolutions.net>)
        id 1lgpm7-007zO9-7d; Wed, 12 May 2021 16:23:47 +0200
Message-ID: <10cc8522b27a051e6a9c3e158a4c4b6414fd04a0.camel@sipsolutions.net>
Subject: Re: [PATCH 6/9] kbuild: refactor scripts/Makefile.modinst
From:   Johannes Berg <johannes@sipsolutions.net>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Date:   Wed, 12 May 2021 16:23:46 +0200
In-Reply-To: <20210331133811.3221540-6-masahiroy@kernel.org>
References: <20210331133811.3221540-1-masahiroy@kernel.org>
         <20210331133811.3221540-6-masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

So I'm not *entirely* sure if this caused it, but I noticed that doing

	make -C linux M=/path/to/extmod/ modules_install

stopped working.

This is because here:
> 
> -extmod_prefix = $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)
> +export extmod_prefix = $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)


(as before, of course) another trailing / is added to the M= argument,
and then

> +modules := $(patsubst $(extmod_prefix)%, $(dst)/%, $(modules))

this patsubst turns out to do nothing. So $(modules) contains the
original paths where the modules were compiled, and consequently nothing
happens.

Specifying

	make -C linux M=/path/to/extmod modules_install

actually works.


Obviously I can work around it, but it hardly seems intentional?

Thanks,
johannes

