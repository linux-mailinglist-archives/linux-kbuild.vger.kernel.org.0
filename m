Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A58BE2F7285
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Jan 2021 06:45:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732340AbhAOFpl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Jan 2021 00:45:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729123AbhAOFpf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Jan 2021 00:45:35 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F346BC0613C1
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Jan 2021 21:44:54 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id t6so4150541plq.1
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Jan 2021 21:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=J4IRduRh2lPDHoDnzAXwEKVdTwmGpK4GMKe23FN9dLk=;
        b=rj8Z9+0lMpn1ImzkWb0s2wW/9B+FKkZ4vtshtOtG9AJudfmkuebkIKixPLX+g0MxsH
         tGPn8ub+sFbLGac5dzHm0T6FHu7oNDIEjI87ShJQ4PlIMlZxHPo6KwWb5suAsPv2VjD3
         TdyqZQS1cJomHP3xihTS9sOFskYLMMBYeXyHhi9VAl6GaGopIWjfsSt+QunfH8dtAMde
         XYe47DPafbGSWq3+o2nc4cKwvDA5XCOhDK3Xx8cDwcroXMrikc02XXhacQKBqkEY9xAa
         qYC/IUHplNM2HJ//AvioQC5TrRswqhZNwytBFdgKGf56N5h11ZRN4CcHHNtCXeyftwm3
         mfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=J4IRduRh2lPDHoDnzAXwEKVdTwmGpK4GMKe23FN9dLk=;
        b=jkq9K6LihTYcXYWjUnK213AfXpN5y/NIdDNgv2cr7NfKl+baAJeGVT8KYi61Uc0ty1
         7aXNtlBagm8MhVAh2QgFWg01DqKuXY5R7p3DnX+VKjcRpBBGAsOOF+e7VLPnf9zh8DHi
         FjbNSbzToh9IT3Y8y0eM4ucNpt4EUx+ow22CDjOD2AAKtcR6v/ZFK/fC6rzE8tVXexHd
         sRRNsxvfIiX9Cmr+ITh9bMjEHb22Yx19FwQd7lwCe2NHq8OBef7HB+59zrXV/icXGOEl
         FS4tT5K8yCFJlPGToqASTCqOVBD+tTLypcbhUqlnbUQek/XNUkNhN92rVJfQUcKU5VOP
         Nksg==
X-Gm-Message-State: AOAM5302FF+j66jS35gwqbbz/mLocC4OTnULnbyCKOr2heOWB5KLcMIS
        NrRbTPKL3/obVpCL+6IoMd4mQg==
X-Google-Smtp-Source: ABdhPJwSk1I07SFJLQglrGC/7/9ArvodFIx1gtIW4w1V9yTisS7vVMlHS/d9lk66QEoAmGw0PRC2cw==
X-Received: by 2002:a17:90b:f08:: with SMTP id br8mr8737209pjb.134.1610689494482;
        Thu, 14 Jan 2021 21:44:54 -0800 (PST)
Received: from localhost ([122.172.85.111])
        by smtp.gmail.com with ESMTPSA id bk18sm3194628pjb.41.2021.01.14.21.44.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jan 2021 21:44:53 -0800 (PST)
Date:   Fri, 15 Jan 2021 11:14:50 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        David Gibson <david@gibson.dropbear.id.au>
Cc:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] of: unittest: Statically apply overlays using fdtoverlay
Message-ID: <20210115054450.ab2xrohlxg7nnzpn@vireshk-i7>
References: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
 <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
 <CAL_JsqLpbSOk-OST8Oi7uyFVjekX-15713F1FbDCQWfVWgikMw@mail.gmail.com>
 <20210114050309.wokrhw4o3cjxj5uo@vireshk-i7>
 <CAL_JsqJ=jxBo2JsjNTcBnV_8OrGjUc4ZQEpdVWsfFwWb9YzyFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ=jxBo2JsjNTcBnV_8OrGjUc4ZQEpdVWsfFwWb9YzyFQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+David,

On 14-01-21, 09:01, Rob Herring wrote:
> On Wed, Jan 13, 2021 at 11:03 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 11-01-21, 09:46, Rob Herring wrote:
> > > On Fri, Jan 8, 2021 at 2:41 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > >
> > > > Now that fdtoverlay is part of the kernel build, start using it to test
> > > > the unitest overlays we have by applying them statically.
> > >
> > > Nice idea.
> > >
> > > > The file overlay_base.dtb have symbols of its own and we need to apply
> > > > overlay.dtb to overlay_base.dtb alone first to make it work, which gives
> > > > us intermediate-overlay.dtb file.
> > >
> > > Okay? If restructuring things helps we should do that. Frank?
> >
> > Frank, do we want to do something about it ? Maybe make overlay_base.dts an dtsi
> > and include it from testcases.dts like the other ones ?
> 
> No, because overlay_base.dts is an overlay dt.

What property of a file makes it an overlay ? Just the presence of /plugin/; ?

David, we are talking about the overlay base[1] file here. The fdtoverlay tool
fails to apply it to testcases.dts file (in the same directory) because none of
its nodes have the __overlay__ label and the dtc routine overlay_merge() [2]
skips them intentionally.

> I think we need an
> empty, minimal base.dtb to apply overlay_base.dtbo to.

One way out is adding an (almost-empty) testcase-data-2 in testcases.dtb, that
will make it work.

> And then fdtoverlay needs a fix to apply overlays to the root node?

It isn't just root node I think, but any node for which the __overlay__ label
isn't there.

So this can make it all work if everyone is fine with it:

diff --git a/drivers/of/unittest-data/overlay_base.dts b/drivers/of/unittest-data/overlay_base.dts
index 99ab9d12d00b..59172c4c9e5a 100644
--- a/drivers/of/unittest-data/overlay_base.dts
+++ b/drivers/of/unittest-data/overlay_base.dts
@@ -11,8 +11,7 @@
  * dtc will create nodes "/__symbols__" and "/__local_fixups__".
  */
 
-/ {
-       testcase-data-2 {
+       &overlay_base {
                #address-cells = <1>;
                #size-cells = <1>;
 
@@ -89,5 +88,3 @@ retail_1: vending@50000 {
                };
 
        };
-};
-
diff --git a/drivers/of/unittest-data/testcases.dts b/drivers/of/unittest-data/testcases.dts
index a85b5e1c381a..539dc7d9eddc 100644
--- a/drivers/of/unittest-data/testcases.dts
+++ b/drivers/of/unittest-data/testcases.dts
@@ -11,6 +11,11 @@ node-remove {
                        };
                };
        };
+
+       overlay_base: testcase-data-2 {
+               #address-cells = <1>;
+               #size-cells = <1>;
+       };

-------------------------8<-------------------------

And then we can do this to the Makefile over my changes.

-------------------------8<-------------------------

diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
index 9f3eb30b78f1..8cc23311b778 100644
--- a/drivers/of/unittest-data/Makefile
+++ b/drivers/of/unittest-data/Makefile
@@ -41,7 +41,6 @@ DTC_FLAGS_testcases += -Wno-interrupts_property
 
 # Apply all overlays (except overlay_bad_* as they are not supposed to apply and
 # fail build) statically with fdtoverlay
-intermediate-overlay   := overlay.dtb
 master                 := overlay_0.dtb overlay_1.dtb overlay_2.dtb \
                           overlay_3.dtb overlay_4.dtb overlay_5.dtb \
                           overlay_6.dtb overlay_7.dtb overlay_8.dtb \
@@ -50,15 +49,12 @@ master                      := overlay_0.dtb overlay_1.dtb overlay_2.dtb \
                           overlay_gpio_01.dtb overlay_gpio_02a.dtb \
                           overlay_gpio_02b.dtb overlay_gpio_03.dtb \
                           overlay_gpio_04a.dtb overlay_gpio_04b.dtb \
-                          intermediate-overlay.dtb
+                          overlay_base.dtb overlay.dtb
 
 quiet_cmd_fdtoverlay = fdtoverlay $@
       cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $^
 
-$(obj)/intermediate-overlay.dtb: $(obj)/overlay_base.dtb $(addprefix $(obj)/,$(intermediate-overlay))
-       $(call if_changed,fdtoverlay)
-
 $(obj)/master.dtb: $(obj)/testcases.dtb $(addprefix $(obj)/,$(master))
        $(call if_changed,fdtoverlay)
 
-always-$(CONFIG_OF_OVERLAY) += intermediate-overlay.dtb master.dtb
+always-$(CONFIG_OF_OVERLAY) += master.dtb

-- 
viresh

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/of/unittest-data/overlay_base.dts
[2] https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/libfdt/fdt_overlay.c#n628
