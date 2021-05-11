Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0C1237A84F
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 May 2021 15:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231489AbhEKOAc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 11 May 2021 10:00:32 -0400
Received: from foss.arm.com ([217.140.110.172]:48358 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231461AbhEKOAc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 May 2021 10:00:32 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC836101E;
        Tue, 11 May 2021 06:59:25 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.29.91])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10C733F718;
        Tue, 11 May 2021 06:59:23 -0700 (PDT)
Date:   Tue, 11 May 2021 14:59:20 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-hardening@vger.kernel.org, Qing Zhao <qing.zhao@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org
Subject: Re: [PATCH] Makefile: Introduce CONFIG_ZERO_CALL_USED_REGS
Message-ID: <20210511135920.GB8933@C02TD0UTHF1T.local>
References: <20210505191804.4015873-1-keescook@chromium.org>
 <20210506125457.GA34956@C02TD0UTHF1T.local>
 <202105061416.3CB40BE5@keescook>
 <20210510134503.GA88495@C02TD0UTHF1T.local>
 <202105101458.EC466299@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202105101458.EC466299@keescook>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 10, 2021 at 03:01:48PM -0700, Kees Cook wrote:
> On Mon, May 10, 2021 at 02:45:03PM +0100, Mark Rutland wrote:

[...]

> > That's 441301 new MOVs, and the equivalent of 442511 new instructions
> > overall. There are 135728 new MOVs to x16 and x17 specifically, which
> > account for ~31% of that.
> 
> I assume the x16/x17 case could be addressed by the compiler if it
> examined the need for PLTs, or is that too late (in the sense that the
> linker is doing that phase)?

Most (all?) PLTs will be created at link time, and IIUC the compiler
simply has to assume any non-static function might have a PLT, since the
AAPCS permits that. Maybe some of the smaller memory size models don't
permit PLTs, but I have no real knowledge of that area and I'm already
out on a limb.

LTO could probably help with visiblity, but otherwise I don't see a way
the compiler could be sure a PLT won't exist.

> Regardless, I will update the documentation on this feature. :)

Great; thanks!

Mark.
