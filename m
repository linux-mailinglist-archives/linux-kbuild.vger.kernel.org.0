Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD9725E6A4
	for <lists+linux-kbuild@lfdr.de>; Sat,  5 Sep 2020 11:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgIEJMv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 5 Sep 2020 05:12:51 -0400
Received: from bmailout2.hostsharing.net ([83.223.78.240]:57755 "EHLO
        bmailout2.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgIEJMv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 Sep 2020 05:12:51 -0400
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
        by bmailout2.hostsharing.net (Postfix) with ESMTPS id 9191A28004EAC;
        Sat,  5 Sep 2020 11:12:38 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id 60D06128025; Sat,  5 Sep 2020 11:12:38 +0200 (CEST)
Date:   Sat, 5 Sep 2020 11:12:38 +0200
From:   Lukas Wunner <lukas@wunner.de>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kbuild@vger.kernel.org, debian-kernel@lists.debian.org,
        kernel-team@fedoraproject.org, kernel@gentoo.org,
        opensuse-kernel@opensuse.org
Subject: Re: [PATCH] kbuild: Cross-compile binaries to build modules on target
Message-ID: <20200905091238.GA27604@wunner.de>
References: <c744107b341e487cf37139597a7775f6f62e12e8.1596702608.git.lukas@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c744107b341e487cf37139597a7775f6f62e12e8.1596702608.git.lukas@wunner.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
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

Dear Masahiro,

this patch has been on the list for a month, unfortunately without
any comments.  I was wondering what your thoughts are on it?
Would be great to have this functionality in mainline.

Thanks,

Lukas
