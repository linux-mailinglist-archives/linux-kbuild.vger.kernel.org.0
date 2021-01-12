Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 123542F3294
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Jan 2021 15:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729714AbhALOFu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Jan 2021 09:05:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:48920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727954AbhALOFu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jan 2021 09:05:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4EFF423102;
        Tue, 12 Jan 2021 14:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610460309;
        bh=hEyF8u1jTp1PdY2BgjCeEQOjkCa4GQKBP+Ai0lRFwnI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZAkvt9t8Aor96P99OppfBioEuqN08bN/qqHnCLPzBFsvHwmv+TS5L8y1SfDjvkb6Z
         XFZX5vBv7oYPhEdmv8k5dra3x9f96FoJg4SPVBSKq/f8uJKTa26JsEUf3UDBvCdSt8
         8i4IOG28IJ62lXksW63gSRG5A0QTggaL/riLMgJE6f6WqZMHx7yMvtNPCMAwYdDz7F
         LO5NUok+6iBA7bs1wo0ggXTchXqxQEUm5k1mNuiXRj0bv1JXHa48RH6GnQ3GDZjsaf
         hEU76Wzmzvelqd7vTZ2wVCp2qRXE4QAGzB6Uzbpzzt8j7JVJ1CUp0O6zAlNDNCAzAA
         FtrPayBvBq32w==
Received: by mail-ed1-f44.google.com with SMTP id b2so2439674edm.3;
        Tue, 12 Jan 2021 06:05:09 -0800 (PST)
X-Gm-Message-State: AOAM53316nN7HgC7KDeycUKipurB+TP2owX5sEGSKLRWTdJWChSp7zdU
        xIaqTYV4IxcUX05D3SfV4rA/Al8KmkCDGlrL9Q==
X-Google-Smtp-Source: ABdhPJzjVbF8BgyTS7DJvzisOGRLdNi2IpAmco42wRjcHhwS40VmHg7+FIb+DgXEMB/Ze3HWtm2nQceT3ldNB4rsaeE=
X-Received: by 2002:a50:f404:: with SMTP id r4mr3569989edm.62.1610460307833;
 Tue, 12 Jan 2021 06:05:07 -0800 (PST)
MIME-Version: 1.0
References: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
 <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
 <23e16d20-36eb-87d9-4473-142504ad8a95@gmail.com>
In-Reply-To: <23e16d20-36eb-87d9-4473-142504ad8a95@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 12 Jan 2021 08:04:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKqSVGCjcue=ka2=bB1Os9pczNTCqDeaoFPFfRxnvsteQ@mail.gmail.com>
Message-ID: <CAL_JsqKqSVGCjcue=ka2=bB1Os9pczNTCqDeaoFPFfRxnvsteQ@mail.gmail.com>
Subject: Re: [PATCH] of: unittest: Statically apply overlays using fdtoverlay
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 11, 2021 at 4:06 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 1/8/21 2:41 AM, Viresh Kumar wrote:
> > Now that fdtoverlay is part of the kernel build, start using it to test
> > the unitest overlays we have by applying them statically.
> >
> > The file overlay_base.dtb have symbols of its own and we need to apply
> > overlay.dtb to overlay_base.dtb alone first to make it work, which gives
> > us intermediate-overlay.dtb file.
> >
> > The intermediate-overlay.dtb file along with all other overlays is them
> > applied to testcases.dtb to generate the master.dtb file.
> >
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>
> NACK to this specific patch, in its current form.
>
> There are restrictions on applying an overlay at runtime that do not apply
> to applying an overlay to an FDT that will be loaded by the kernel during
> early boot.  Thus the unittest overlays _must_ be applied using the kernel
> overlay loading methods to test the kernel runtime overlay loading feature.

This patch doesn't take away from any of that and it completely orthogonal.

> I agree that testing fdtoverlay is a good idea.  I have not looked at the
> parent project to see how much testing of fdtoverlay occurs there, but I
> would prefer that fdtoverlay tests reside in the parent project if practical
> and reasonable.  If there is some reason that some fdtoverlay tests are
> more practical in the Linux kernel repository then I am open to adding
> them to the Linux kernel tree.

If you (or more importantly someone else sending us patches) make
changes to the overlays, you can test that they apply at build time
rather than runtime. I'll take it! So please help on fixing the issue
because I want to apply this.

And yes, dtc has fdtoverlay tests. But this patch shows there's at
least 2 issues. fdtoverlay can't apply overlays to the root and using
an overlay as the base tree in UML is odd IMO.

Rob
