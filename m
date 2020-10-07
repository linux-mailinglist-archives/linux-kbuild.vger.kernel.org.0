Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2473D285896
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Oct 2020 08:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbgJGGWM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Oct 2020 02:22:12 -0400
Received: from bmailout3.hostsharing.net ([176.9.242.62]:43891 "EHLO
        bmailout3.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgJGGWM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Oct 2020 02:22:12 -0400
X-Greylist: delayed 484 seconds by postgrey-1.27 at vger.kernel.org; Wed, 07 Oct 2020 02:22:11 EDT
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
        by bmailout3.hostsharing.net (Postfix) with ESMTPS id 226D910029E43;
        Wed,  7 Oct 2020 08:14:05 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id C9C4378767; Wed,  7 Oct 2020 08:14:04 +0200 (CEST)
Date:   Wed, 7 Oct 2020 08:14:04 +0200
From:   Lukas Wunner <lukas@wunner.de>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org,
        kernel-team@fedoraproject.org, kernel@gentoo.org,
        opensuse-kernel@opensuse.org
Subject: Re: [PATCH] kbuild: Cross-compile binaries to build modules on target
Message-ID: <20201007061404.GA9356@wunner.de>
References: <c744107b341e487cf37139597a7775f6f62e12e8.1596702608.git.lukas@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c744107b341e487cf37139597a7775f6f62e12e8.1596702608.git.lukas@wunner.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 06, 2020 at 10:33:22AM +0200, Lukas Wunner wrote:
> To build external modules, one needs executables such as fixdep and
> modpost.  But when cross-compiling the kernel, those executables are
> only generated for the host arch, not the target arch.
[...]
> Make distribution maintainers' lives easier by providing a new target
> "make kbuild_install" which cross-compiles the required executables for
> the target arch and installs them below $(INSTALL_KBUILD_PATH).

Two months have passed since I submitted this, alas without any
comments.  Masahiro, Michal, what are your thoughts on this patch?
Pretty please?

Thank you,

Lukas
