Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20A2B2FB3BB
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Jan 2021 09:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbhASIH1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 Jan 2021 03:07:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730640AbhASIGg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Jan 2021 03:06:36 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02FDDC061574
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Jan 2021 00:05:51 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id c132so12524757pga.3
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Jan 2021 00:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=B9av3c9EVDy0Kp7r5oWtAX7MDNulotTKI6zgoCnrCLA=;
        b=FajaDMZ1sBx3t1sO/boGkvNs4bf9z1J0Dp762By3mg+E/owcv3tvxG3kQ2E87JFqMV
         WW5b/AwRRR9NCNrtor5emC238Ns25VQHtaL2wRfBlwuXzvd+gYzOLItRiZC+TWl5z5yp
         YOTNEQ8Ri2wnB/265BmV0rt/8JEG0xT9cW6IYuWMVvAy/0dyOeYX2NvS2f1W/3K0pmPI
         euEJsNJMfn+k0wB0GW6zUV7NcYgy+5eVpNWdUNyJZS0RadXeA0TjBplD6hzu593HZrQN
         /lJL3BX1dT67iHZv+noB5wOJQMKnALU4DCklbaHAA8u0/U6gAcJ7Fv821tVaPwCFx8kB
         QUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=B9av3c9EVDy0Kp7r5oWtAX7MDNulotTKI6zgoCnrCLA=;
        b=fOd/TyZvanPiS+8fEM/PZnkaCaHxkxBdy+WKsRgCrlHYcInj38Zg2p0g7e0xOiO+b5
         2TqkOq3WjCp4p/c9/grwdlJvBE9FDL2K5lkvVZnK8iMvoO2lznM56Q8BX9qXFe9n5WeW
         Ao+DbXJwVLyUoyjKWxt7Mhw3fQn9uyyjzZE+SsKoSafKvzquNauCsXLLVeS7YLMAPJMM
         rfqebyEPkS1fH81vLtFRgsYMnc1aBHv8/81rEvALKben4WpjkQT4IpxmyFnzUsHEPEGL
         XeZk95fZxR1Z43KlWQFsaa+rSX2TewUk3PZH9iapWqaDwjHatS46ynaBcIK1h5oOpdOl
         OjVw==
X-Gm-Message-State: AOAM531w3ecVbHW7JbknqWYplRwAzrgQ5uJSIWsTt8uu0bIJkNkmOs/l
        cnNQBfZcOZT6C9LvokQaLTBK0w==
X-Google-Smtp-Source: ABdhPJy8ans4r1xvTNqv2emVB8l4EFTrotYo0HKZxGKiL5K5oYJRNpfpzHxDavY+pGdYcOV6+8YTsQ==
X-Received: by 2002:a63:4851:: with SMTP id x17mr3298027pgk.451.1611043549830;
        Tue, 19 Jan 2021 00:05:49 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id b13sm18397199pfi.162.2021.01.19.00.05.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jan 2021 00:05:48 -0800 (PST)
Date:   Tue, 19 Jan 2021 13:35:46 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     frowand.list@gmail.com
Cc:     Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] of: unittest: Statically apply overlays using fdtoverlay
Message-ID: <20210119080546.dzec3jatsz2662qs@vireshk-i7>
References: <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
 <20210119022154.2338781-1-frowand.list@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210119022154.2338781-1-frowand.list@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 18-01-21, 20:21, frowand.list@gmail.com wrote:
> From: Frank Rowand <frank.rowand@sony.com>
> 
> These changes apply on top of the patches in:
> 
>   [PATCH] of: unittest: Statically apply overlays using fdtoverlay
>   Message-Id: <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
> 
> There are still some issues to be cleaned up, so not ready for acceptance.

Are you talking about the missing __overlay__ thing ? (more below)

> I have not used the construct "always-$(CONFIG_OF_OVERLAY)" before, and
> have not looked into the proper usage of it.

I wasn't sure either, maybe Masahiro can suggest the best fit.

> I tested this using a hand build libfdt and fdtoverlay from the dtc-compiler
> upstream project.  For my testing I added LD_LIBRARY_PATH to the body of
> "cmd_fdtoverlay" to reference my hand built libfdt.  The kernel build
> system will have to instead use a libfdt that is built in the kernel
> tree.

I tested it with this patchset:

https://lore.kernel.org/lkml/cover.1610431620.git.viresh.kumar@linaro.org/

> I have not run this through checkpatch, or my checks for build warnings.
> I have not run unittests on my target with these patches applied.
> 
> ---
>  drivers/of/unittest-data/Makefile | 67 ++++++++++++++++++++++---------
>  1 file changed, 48 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
> index f17bce85f65f..28614a123d1e 100644
> --- a/drivers/of/unittest-data/Makefile
> +++ b/drivers/of/unittest-data/Makefile
> @@ -39,25 +39,54 @@ DTC_FLAGS_testcases += -@
>  # suppress warnings about intentional errors
>  DTC_FLAGS_testcases += -Wno-interrupts_property
>  
> -# Apply overlays statically with fdtoverlay
> -intermediate-overlay	:= overlay.dtb
> -master			:= overlay_0.dtb overlay_1.dtb overlay_2.dtb \
> -			   overlay_3.dtb overlay_4.dtb overlay_5.dtb \
> -			   overlay_6.dtb overlay_7.dtb overlay_8.dtb \
> -			   overlay_9.dtb overlay_10.dtb overlay_11.dtb \
> -			   overlay_12.dtb overlay_13.dtb overlay_15.dtb \
> -			   overlay_gpio_01.dtb overlay_gpio_02a.dtb \
> -			   overlay_gpio_02b.dtb overlay_gpio_03.dtb \
> -			   overlay_gpio_04a.dtb overlay_gpio_04b.dtb \
> -			   intermediate-overlay.dtb
> -
> -quiet_cmd_fdtoverlay = fdtoverlay $@
> -      cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $^
> -
> -$(obj)/intermediate-overlay.dtb: $(obj)/overlay_base.dtb $(addprefix $(obj)/,$(intermediate-overlay))
> -	$(call if_changed,fdtoverlay)
> +# Apply overlays statically with fdtoverlay.  This is a build time test that
> +# the overlays can be applied successfully by fdtoverlay.  This does not
> +# guarantee that the overlays can be applied successfully at run time by
> +# unittest, but it provides a bit of build time test coverage for those
> +# who do not execute unittest.
> +#
> +# The overlays are applied on top of testcases.dtb to create static_test.dtb
> +# If fdtoverlay detects an error than the kernel build will fail.
> +# static_test.dtb is not consumed by unittest.
> +#
> +# Some unittest overlays deliberately contain errors that unittest checks for.
> +# These overlays will cause fdtoverlay to fail, and are thus not included
> +# in the static test:
> +#			overlay.dtb \
> +#			overlay_bad_add_dup_node.dtb \
> +#			overlay_bad_add_dup_prop.dtb \
> +#			overlay_bad_phandle.dtb \
> +#			overlay_bad_symbol.dtb \
> +
> +apply_static_overlay := overlay_base.dtb \

This won't work because of the issues I mentioned earlier. This file
doesn't have __overlay__. One way to fix that is to do this:

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

> -always-$(CONFIG_OF_OVERLAY) += intermediate-overlay.dtb master.dtb
> +always-$(CONFIG_OF_OVERLAY) += static_test.dtb

This is how static_test.dtb looks now with fdtdump

/dts-v1/;
// magic:		0xd00dfeed
// totalsize:		0x261b (9755)
// off_dt_struct:	0x38
// off_dt_strings:	0x22dc
// off_mem_rsvmap:	0x28
// version:		17
// last_comp_version:	16
// boot_cpuid_phys:	0x0
// size_dt_strings:	0x33f
// size_dt_struct:	0x22a4

/ {
    #address-cells = <0x00000001>;
    #size-cells = <0x00000001>;
    testcase-data {
        security-password = "password";
        duplicate-name = "duplicate";
        #address-cells = <0x00000001>;
        #size-cells = <0x00000001>;
        ranges;
        phandle = <0x0000000b>;
        changeset {
            prop-update = "hello";
            prop-remove = "world";
            node-remove {
            };
        };
        duplicate-name {
        };
        phandle-tests {
            provider0 {
                #phandle-cells = <0x00000000>;
                phandle = <0x00000002>;
            };
            provider1 {
                #phandle-cells = <0x00000001>;
                phandle = <0x00000001>;
            };
            provider2 {
                #phandle-cells = <0x00000002>;
                phandle = <0x00000004>;
            };
            provider3 {
                #phandle-cells = <0x00000003>;
                phandle = <0x00000003>;
            };
            provider4 {
                #phandle-cells = <0x00000002>;
                phandle-map = <0x00000000 0x00000001 0x00000001 0x00000003 0x00000004 0x00000000 0x00000002 0x00000010 0x00000005 0x00000003 0x00000003 0x00000005 0x00000000 0x000000c8 0x00000008 0x00000004 0x00000017 0x00000006 0x00000013 0x00000000 0x00000004 0x0000000f 0x00000000 0x00000002 0x00000003 0x00000003 0x00000002 0x00000005 0x00000003>;
                phandle-map-mask = <0x000000ff 0x0000000f>;
                phandle-map-pass-thru = <0x00000000 0x000000f0>;
                phandle = <0x00000005>;
            };
            consumer-a {
                phandle-list = <0x00000001 0x00000001 0x00000004 0x00000002 0x00000000 0x00000000 0x00000003 0x00000004 0x00000004 0x00000003 0x00000004 0x00000005 0x00000064 0x00000002 0x00000001 0x00000007>;
                phandle-list-names = "first", "second", "third";
                phandle-list-bad-phandle = <0x00bc614e 0x00000000 0x00000000>;
                phandle-list-bad-args = <0x00000004 0x00000001 0x00000000 0x00000003 0x00000000>;
                empty-property;
                string-property = "foobar";
                unterminated-string = <0x40414243>;
                unterminated-string-list = [66 69 72 73 74 00 73 65 63 6f 6e 64 00 40 41 42 43];
            };
            consumer-b {
                phandle-list = <0x00000001 0x00000001 0x00000005 0x00000002 0x00000003 0x00000000 0x00000005 0x00000004 0x00000100 0x00000005 0x00000000 0x00000061 0x00000002 0x00000005 0x00000013 0x00000020>;
                phandle-list-bad-phandle = <0x00bc614e 0x00000000 0x00000000>;
                phandle-list-bad-args = <0x00000004 0x00000001 0x00000000 0x00000005 0x00000000>;
            };
        };
        interrupts {
            #address-cells = <0x00000001>;
            #size-cells = <0x00000001>;
            intc0 {
                interrupt-controller;
                #interrupt-cells = <0x00000001>;
                phandle = <0x00000006>;
            };
            intc1 {
                interrupt-controller;
                #interrupt-cells = <0x00000003>;
                phandle = <0x00000007>;
            };
            intc2 {
                interrupt-controller;
                #interrupt-cells = <0x00000002>;
                phandle = <0x00000008>;
            };
            intmap0 {
                #interrupt-cells = <0x00000001>;
                #address-cells = <0x00000000>;
                interrupt-map = <0x00000001 0x00000006 0x00000009 0x00000002 0x00000007 0x0000000a 0x0000000b 0x0000000c 0x00000003 0x00000008 0x0000000d 0x0000000e 0x00000004 0x00000008 0x0000000f 0x00000010>;
                phandle = <0x00000009>;
            };
            intmap1 {
                #interrupt-cells = <0x00000002>;
                interrupt-map = <0x00005000 0x00000001 0x00000002 0x00000006 0x0000000f>;
                phandle = <0x0000000a>;
            };
            interrupts0 {
                interrupt-parent = <0x00000006>;
                interrupts = <0x00000001 0x00000002 0x00000003 0x00000004>;
            };
            interrupts1 {
                interrupt-parent = <0x00000009>;
                interrupts = <0x00000001 0x00000002 0x00000003 0x00000004>;
            };
            interrupts-extended0 {
                reg = <0x00005000 0x00000100>;
                interrupts-extended = <0x00000006 0x00000001 0x00000007 0x00000002 0x00000003 0x00000004 0x00000008 0x00000005 0x00000006 0x00000009 0x00000001 0x00000009 0x00000002 0x00000009 0x00000003 0x0000000a 0x00000001 0x00000002>;
            };
        };
        testcase-device1 {
            compatible = "testcase-device";
            interrupt-parent = <0x00000006>;
            interrupts = <0x00000001>;
        };
        testcase-device2 {
            compatible = "testcase-device";
            interrupt-parent = <0x00000008>;
            interrupts = <0x00000001>;
        };
        match-node {
            name0 {
            };
            name1 {
                device_type = "type1";
            };
            a {
                name2 {
                    device_type = "type1";
                };
            };
            b {
                name2 {
                };
            };
            c {
                name2 {
                    device_type = "type2";
                };
            };
            name3 {
                compatible = "compat3";
            };
            name4 {
                compatible = "compat2", "compat3";
            };
            name5 {
                compatible = "compat2", "compat3";
            };
            name6 {
                compatible = "compat1", "compat2", "compat3";
            };
            name7 {
                compatible = "compat2";
                device_type = "type1";
            };
            name8 {
                compatible = "compat2";
                device_type = "type1";
            };
            name9 {
                compatible = "compat2";
            };
        };
        address-tests {
            #address-cells = <0x00000001>;
            #size-cells = <0x00000001>;
            ranges = <0x70000000 0x70000000 0x40000000 0x00000000 0xd0000000 0x20000000>;
            dma-ranges = <0x00000000 0x20000000 0x40000000>;
            device@70000000 {
                reg = <0x70000000 0x00001000>;
            };
            bus@80000000 {
                #address-cells = <0x00000002>;
                #size-cells = <0x00000002>;
                ranges = <0x00000000 0x00000000 0x80000000 0x00000000 0x00100000>;
                dma-ranges = <0x00000001 0x00000000 0x00000000 0x00000020 0x00000000>;
                device@1000 {
                    reg = <0x00000000 0x00001000 0x00000000 0x00001000>;
                };
            };
            pci@90000000 {
                device_type = "pci";
                #address-cells = <0x00000003>;
                #size-cells = <0x00000002>;
                reg = <0x90000000 0x00001000>;
                ranges = <0x42000000 0x00000000 0x40000000 0x40000000 0x00000000 0x10000000>;
                dma-ranges = <0x42000000 0x00000000 0x80000000 0x00000000 0x00000000 0x10000000 0x42000000 0x00000000 0xc0000000 0x20000000 0x00000000 0x10000000>;
            };
        };
        platform-tests {
            #address-cells = <0x00000001>;
            #size-cells = <0x00000000>;
            test-device@0 {
                compatible = "test-device";
                reg = <0x00000000>;
                #address-cells = <0x00000001>;
                #size-cells = <0x00000000>;
                dev@100 {
                    compatible = "test-sub-device";
                    reg = <0x00000100>;
                };
            };
            test-device@1 {
                compatible = "test-device";
                reg = <0x00000001>;
                #address-cells = <0x00000001>;
                #size-cells = <0x00000000>;
                dev@100 {
                    compatible = "test-sub-device", "test-compat2", "test-compat3";
                    reg = <0x00000100>;
                };
            };
        };
        overlay-node {
            test-bus {
                compatible = "simple-bus";
                #address-cells = <0x00000001>;
                #size-cells = <0x00000000>;
                phandle = <0x0000000c>;
                gpio@4 {
                    gpio-line-names = "line-A", "line-B", "line-C", "line-D";
                    ngpios = <0x00000002>;
                    #gpio-cells = <0x00000002>;
                    gpio-controller;
                    reg = <0x00000004>;
                    compatible = "unittest-gpio";
                    line-c {
                        line-name = "line-C-input";
                        input;
                        gpios = <0x00000003 0x00000000>;
                        gpio-hog;
                    };
                };
                gpio@3 {
                    gpio-line-names = "line-A", "line-B", "line-C", "line-D";
                    ngpios = <0x00000002>;
                    #gpio-cells = <0x00000002>;
                    gpio-controller;
                    reg = <0x00000003>;
                    compatible = "unittest-gpio";
                    line-d {
                        line-name = "line-D-input";
                        input;
                        gpios = <0x00000004 0x00000000>;
                        gpio-hog;
                    };
                };
                gpio@2 {
                    gpio-line-names = "line-A", "line-B";
                    ngpios = <0x00000002>;
                    #gpio-cells = <0x00000002>;
                    gpio-controller;
                    reg = <0x00000002>;
                    compatible = "unittest-gpio";
                    line-a {
                        line-name = "line-A-input";
                        input;
                        gpios = <0x00000001 0x00000000>;
                        gpio-hog;
                    };
                };
                gpio@0 {
                    gpio-line-names = "line-A", "line-B";
                    ngpios = <0x00000002>;
                    #gpio-cells = <0x00000002>;
                    gpio-controller;
                    reg = <0x00000000>;
                    compatible = "unittest-gpio";
                    line-b {
                        line-name = "line-B-input";
                        input;
                        gpios = <0x00000002 0x00000000>;
                        gpio-hog;
                    };
                };
                test-unittest11 {
                    #size-cells = <0x00000000>;
                    #address-cells = <0x00000001>;
                    reg = <0x0000000b>;
                    status = "okay";
                    compatible = "unittest";
                    test-unittest111 {
                        reg = <0x00000001>;
                        status = "okay";
                        compatible = "unittest";
                    };
                };
                test-unittest10 {
                    #size-cells = <0x00000000>;
                    #address-cells = <0x00000001>;
                    reg = <0x0000000a>;
                    status = "okay";
                    compatible = "unittest";
                    test-unittest101 {
                        reg = <0x00000001>;
                        status = "okay";
                        compatible = "unittest";
                    };
                };
                test-unittest4 {
                    reg = <0x00000004>;
                    status = "okay";
                    compatible = "unittest";
                };
                test-unittest100 {
                    compatible = "unittest";
                    status = "okay";
                    reg = <0x00000064>;
                    phandle = <0x0000000d>;
                };
                test-unittest101 {
                    compatible = "unittest";
                    status = "disabled";
                    reg = <0x00000065>;
                    phandle = <0x0000000e>;
                };
                test-unittest0 {
                    compatible = "unittest";
                    status = "okay";
                    reg = <0x00000000>;
                    phandle = <0x0000000f>;
                };
                test-unittest1 {
                    compatible = "unittest";
                    status = "disabled";
                    reg = <0x00000001>;
                    phandle = <0x00000010>;
                };
                test-unittest2 {
                    compatible = "unittest";
                    status = "okay";
                    reg = <0x00000002>;
                    phandle = <0x00000011>;
                };
                test-unittest3 {
                    compatible = "unittest";
                    status = "disabled";
                    reg = <0x00000003>;
                    phandle = <0x00000012>;
                };
                test-unittest5 {
                    compatible = "unittest";
                    status = "okay";
                    reg = <0x00000005>;
                    phandle = <0x00000013>;
                };
                test-unittest6 {
                    compatible = "unittest";
                    status = "okay";
                    reg = <0x00000006>;
                    phandle = <0x00000014>;
                };
                test-unittest7 {
                    compatible = "unittest";
                    status = "okay";
                    reg = <0x00000007>;
                    phandle = <0x00000015>;
                };
                test-unittest8 {
                    property-foo = "bar";
                    compatible = "unittest";
                    status = "okay";
                    reg = <0x00000008>;
                    phandle = <0x00000016>;
                };
                i2c-test-bus {
                    compatible = "unittest-i2c-bus";
                    status = "okay";
                    reg = <0x00000032>;
                    #address-cells = <0x00000001>;
                    #size-cells = <0x00000000>;
                    phandle = <0x00000017>;
                    test-unittest15 {
                        #size-cells = <0x00000000>;
                        #address-cells = <0x00000001>;
                        status = "okay";
                        compatible = "unittest-i2c-mux";
                        reg = <0x0000000b>;
                        i2c@0 {
                            reg = <0x00000000>;
                            #size-cells = <0x00000000>;
                            #address-cells = <0x00000001>;
                            test-mux-dev@20 {
                                status = "okay";
                                compatible = "unittest-i2c-dev";
                                reg = <0x00000020>;
                            };
                        };
                    };
                    test-unittest12 {
                        reg = <0x00000008>;
                        compatible = "unittest-i2c-dev";
                        status = "okay";
                    };
                    test-unittest13 {
                        reg = <0x00000009>;
                        compatible = "unittest-i2c-dev";
                        status = "disabled";
                    };
                    test-unittest14 {
                        reg = <0x0000000a>;
                        compatible = "unittest-i2c-mux";
                        status = "okay";
                        #address-cells = <0x00000001>;
                        #size-cells = <0x00000000>;
                        i2c@0 {
                            #address-cells = <0x00000001>;
                            #size-cells = <0x00000000>;
                            reg = <0x00000000>;
                            test-mux-dev@20 {
                                reg = <0x00000020>;
                                compatible = "unittest-i2c-dev";
                                status = "okay";
                            };
                        };
                    };
                };
            };
        };
    };
    aliases {
        testcase-alias = "/testcase-data";
    };
    __symbols__ {
        testcase = "/testcase-data";
        provider0 = "/testcase-data/phandle-tests/provider0";
        provider1 = "/testcase-data/phandle-tests/provider1";
        provider2 = "/testcase-data/phandle-tests/provider2";
        provider3 = "/testcase-data/phandle-tests/provider3";
        provider4 = "/testcase-data/phandle-tests/provider4";
        test_intc0 = "/testcase-data/interrupts/intc0";
        test_intc1 = "/testcase-data/interrupts/intc1";
        test_intc2 = "/testcase-data/interrupts/intc2";
        test_intmap0 = "/testcase-data/interrupts/intmap0";
        test_intmap1 = "/testcase-data/interrupts/intmap1";
        unittest_test_bus = "/testcase-data/overlay-node/test-bus";
        unittest100 = "/testcase-data/overlay-node/test-bus/test-unittest100";
        unittest101 = "/testcase-data/overlay-node/test-bus/test-unittest101";
        unittest0 = "/testcase-data/overlay-node/test-bus/test-unittest0";
        unittest1 = "/testcase-data/overlay-node/test-bus/test-unittest1";
        unittest2 = "/testcase-data/overlay-node/test-bus/test-unittest2";
        unittest3 = "/testcase-data/overlay-node/test-bus/test-unittest3";
        unittest5 = "/testcase-data/overlay-node/test-bus/test-unittest5";
        unittest6 = "/testcase-data/overlay-node/test-bus/test-unittest6";
        unittest7 = "/testcase-data/overlay-node/test-bus/test-unittest7";
        unittest8 = "/testcase-data/overlay-node/test-bus/test-unittest8";
        unittest_i2c_test_bus = "/testcase-data/overlay-node/test-bus/i2c-test-bus";
    };
    __local_fixups__ {
        testcase-data {
            phandle-tests {
                provider4 {
                    phandle-map = <0x00000008 0x00000018 0x00000024 0x0000003c 0x00000050 0x00000064>;
                };
                consumer-a {
                    phandle-list = <0x00000000 0x00000008 0x00000018 0x00000028 0x00000034 0x00000038>;
                    phandle-list-bad-args = <0x00000000 0x0000000c>;
                };
                consumer-b {
                    phandle-list = <0x00000000 0x00000008 0x00000018 0x00000024 0x00000030 0x00000034>;
                    phandle-list-bad-args = <0x00000000 0x0000000c>;
                };
            };
            interrupts {
                intmap0 {
                    interrupt-map = <0x00000004 0x00000010 0x00000024 0x00000034>;
                };
                intmap1 {
                    interrupt-map = <0x0000000c>;
                };
                interrupts0 {
                    interrupt-parent = <0x00000000>;
                };
                interrupts1 {
                    interrupt-parent = <0x00000000>;
                };
                interrupts-extended0 {
                    interrupts-extended = <0x00000000 0x00000008 0x00000018 0x00000024 0x0000002c 0x00000034 0x0000003c>;
                };
            };
            testcase-device1 {
                interrupt-parent = <0x00000000>;
            };
            testcase-device2 {
                interrupt-parent = <0x00000000>;
            };
        };
    };
};

-- 
viresh
