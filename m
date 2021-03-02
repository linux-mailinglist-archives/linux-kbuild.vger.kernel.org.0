Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E09232B2FD
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Mar 2021 04:49:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbhCCBQv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Mar 2021 20:16:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239596AbhCBDPM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Mar 2021 22:15:12 -0500
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D7F8C061788;
        Mon,  1 Mar 2021 19:12:17 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id t1so8245798qvj.8;
        Mon, 01 Mar 2021 19:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=smhH6HHLqI1BreYn5aGKi+xq6ykkM+3AdCizKg/x6V0=;
        b=jwc2vMhNB9hf2A23RYIBr18R91FDj8XXeJHanENfsRZEYuaFWsZC4d9ATu+120W84J
         zYldEfiZ34+kGi7mYOMCXbKdPZl0eUI9+TG6RIea+QxCqLu5nhCZmFTJ8B1+sBP5CEOe
         IdsD/2OTUzuWjKqDWzWLNnI2zQNbLW1tTtUsWmXNap9o/iN1lax0AShzOgrv0ZdPqMbo
         oUi2ckToUlyfm4caOZVAP2O4xz+Z/5Cze1VL1pkJzHQUYMzw/P24bcUT8dU4CokDz/qw
         WIOvfXIUWjjZ76MFa2nohAXdwHaKfe7i0avXF1LuzdgM6dfHBC1PoFmwLjAxMyriPuqf
         Ocug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=smhH6HHLqI1BreYn5aGKi+xq6ykkM+3AdCizKg/x6V0=;
        b=sOl0PIdslY9UJUmCxhyFJFtMPilV2LhwzjnG4umMeHFxxHwU5etP//9tL6cfnDvGX8
         fk/0RHJMsRptAajWJSjFs3mvLHj/nTT+zFbHjvgVwZKh/n5culoO2igrpvBVs+ikQPjV
         +VhbrIlfli6efgQSCT8+ql/Hg18qnhBwXFZymOBPVoLuSYH7BrIrM8B4W/pkW1+2jVB1
         cjuARL5vXc4xTi2YSWMHg4U58vxKF2pQnB1d9Nq1jXnLi5qD08FGOLmLb2HytKllrcDz
         ocsIU0ZOjUjt5xa2JkBm3l7a6Ht+wfdxntlof7sAGWAclZBrrHbaIwqyYiVOTBDbOV1+
         ka6w==
X-Gm-Message-State: AOAM531T092Xo6PUDSr/rydkDx6NndQRXXJfty851z5xVmmZzIfiY8Tc
        OW9eNf7BRYxgqw9+YhqCEqAxp2uTEHQ=
X-Google-Smtp-Source: ABdhPJwXUy55A0hZsbKO+S0R6ueEeh0FcPatPlW0i0/6nyIX7XzMqxY65Nlh0O2B48NgPodHvEjNnw==
X-Received: by 2002:a05:6214:52:: with SMTP id c18mr1699893qvr.54.1614654736075;
        Mon, 01 Mar 2021 19:12:16 -0800 (PST)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id c5sm2484058qkg.105.2021.03.01.19.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Mar 2021 19:12:15 -0800 (PST)
Subject: Re: [PATCH V8 3/4] of: unittest: Create overlay_common.dtsi and
 testcases_common.dtsi
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        anmar.oueja@linaro.org, Bill Mills <bill.mills@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Frank Rowand <frowand.list@gmail.com>
References: <cover.1613127681.git.viresh.kumar@linaro.org>
 <d4775a7280b93ffed64291f8f67d9d2dba564f21.1613127681.git.viresh.kumar@linaro.org>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <34c67b01-6504-83c9-c7ec-cc351f0f2423@gmail.com>
Date:   Mon, 1 Mar 2021 21:12:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d4775a7280b93ffed64291f8f67d9d2dba564f21.1613127681.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Viresh,

I commented on this patch in v7 after you had created v8.  You acknowledged
that comment and said that it will be corrected.

-Frank

On 2/12/21 5:18 AM, Viresh Kumar wrote:
> In order to build-test the same unit-test files using fdtoverlay tool,
> move the device nodes from the existing overlay_base.dts and
> testcases_common.dts files to .dtsi counterparts. The .dts files now
> include the new .dtsi files, resulting in exactly the same behavior as
> earlier.
> 
> The .dtsi files can now be reused for compile time tests using
> fdtoverlay (will be done by a later commit).
> 
> This is required because the base files passed to fdtoverlay tool
> shouldn't be overlays themselves (i.e. shouldn't have the /plugin/;
> tag).
> 
> Note that this commit also moves "testcase-device2" node to
> testcases.dts from tests-interrupts.dtsi, as this node has a deliberate
> error in it and is only relevant for runtime testing done with
> unittest.c.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  drivers/of/unittest-data/overlay_base.dts     | 90 +-----------------
>  drivers/of/unittest-data/overlay_common.dtsi  | 91 +++++++++++++++++++
>  drivers/of/unittest-data/testcases.dts        | 18 ++--
>  .../of/unittest-data/testcases_common.dtsi    | 19 ++++
>  .../of/unittest-data/tests-interrupts.dtsi    |  7 --
>  5 files changed, 118 insertions(+), 107 deletions(-)
>  create mode 100644 drivers/of/unittest-data/overlay_common.dtsi
>  create mode 100644 drivers/of/unittest-data/testcases_common.dtsi
> 
> diff --git a/drivers/of/unittest-data/overlay_base.dts b/drivers/of/unittest-data/overlay_base.dts
> index 99ab9d12d00b..ab9014589c5d 100644
> --- a/drivers/of/unittest-data/overlay_base.dts
> +++ b/drivers/of/unittest-data/overlay_base.dts
> @@ -2,92 +2,4 @@
>  /dts-v1/;
>  /plugin/;
>  
> -/*
> - * Base device tree that overlays will be applied against.
> - *
> - * Do not add any properties in node "/".
> - * Do not add any nodes other than "/testcase-data-2" in node "/".
> - * Do not add anything that would result in dtc creating node "/__fixups__".
> - * dtc will create nodes "/__symbols__" and "/__local_fixups__".
> - */
> -
> -/ {
> -	testcase-data-2 {
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -
> -		electric_1: substation@100 {
> -			compatible = "ot,big-volts-control";
> -			reg = < 0x00000100 0x100 >;
> -			status = "disabled";
> -
> -			hvac_1: hvac-medium-1 {
> -				compatible = "ot,hvac-medium";
> -				heat-range = < 50 75 >;
> -				cool-range = < 60 80 >;
> -			};
> -
> -			spin_ctrl_1: motor-1 {
> -				compatible = "ot,ferris-wheel-motor";
> -				spin = "clockwise";
> -				rpm_avail = < 50 >;
> -			};
> -
> -			spin_ctrl_2: motor-8 {
> -				compatible = "ot,roller-coaster-motor";
> -			};
> -		};
> -
> -		rides_1: fairway-1 {
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> -			compatible = "ot,rides";
> -			status = "disabled";
> -			orientation = < 127 >;
> -
> -			ride@100 {
> -				#address-cells = <1>;
> -				#size-cells = <1>;
> -				compatible = "ot,roller-coaster";
> -				reg = < 0x00000100 0x100 >;
> -				hvac-provider = < &hvac_1 >;
> -				hvac-thermostat = < 29 > ;
> -				hvac-zones = < 14 >;
> -				hvac-zone-names = "operator";
> -				spin-controller = < &spin_ctrl_2 5 &spin_ctrl_2 7 >;
> -				spin-controller-names = "track_1", "track_2";
> -				queues = < 2 >;
> -
> -				track@30 {
> -					reg = < 0x00000030 0x10 >;
> -				};
> -
> -				track@40 {
> -					reg = < 0x00000040 0x10 >;
> -				};
> -
> -			};
> -		};
> -
> -		lights_1: lights@30000 {
> -			compatible = "ot,work-lights";
> -			reg = < 0x00030000 0x1000 >;
> -			status = "disabled";
> -		};
> -
> -		lights_2: lights@40000 {
> -			compatible = "ot,show-lights";
> -			reg = < 0x00040000 0x1000 >;
> -			status = "disabled";
> -			rate = < 13 138 >;
> -		};
> -
> -		retail_1: vending@50000 {
> -			reg = < 0x00050000 0x1000 >;
> -			compatible = "ot,tickets";
> -			status = "disabled";
> -		};
> -
> -	};
> -};
> -
> +#include "overlay_common.dtsi"
> diff --git a/drivers/of/unittest-data/overlay_common.dtsi b/drivers/of/unittest-data/overlay_common.dtsi
> new file mode 100644
> index 000000000000..08874a72556e
> --- /dev/null
> +++ b/drivers/of/unittest-data/overlay_common.dtsi
> @@ -0,0 +1,91 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Base device tree that overlays will be applied against.
> + *
> + * Do not add any properties in node "/".
> + * Do not add any nodes other than "/testcase-data-2" in node "/".
> + * Do not add anything that would result in dtc creating node "/__fixups__".
> + * dtc will create nodes "/__symbols__" and "/__local_fixups__".
> + */
> +
> +/ {
> +	testcase-data-2 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		electric_1: substation@100 {
> +			compatible = "ot,big-volts-control";
> +			reg = < 0x00000100 0x100 >;
> +			status = "disabled";
> +
> +			hvac_1: hvac-medium-1 {
> +				compatible = "ot,hvac-medium";
> +				heat-range = < 50 75 >;
> +				cool-range = < 60 80 >;
> +			};
> +
> +			spin_ctrl_1: motor-1 {
> +				compatible = "ot,ferris-wheel-motor";
> +				spin = "clockwise";
> +				rpm_avail = < 50 >;
> +			};
> +
> +			spin_ctrl_2: motor-8 {
> +				compatible = "ot,roller-coaster-motor";
> +			};
> +		};
> +
> +		rides_1: fairway-1 {
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			compatible = "ot,rides";
> +			status = "disabled";
> +			orientation = < 127 >;
> +
> +			ride@100 {
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				compatible = "ot,roller-coaster";
> +				reg = < 0x00000100 0x100 >;
> +				hvac-provider = < &hvac_1 >;
> +				hvac-thermostat = < 29 > ;
> +				hvac-zones = < 14 >;
> +				hvac-zone-names = "operator";
> +				spin-controller = < &spin_ctrl_2 5 &spin_ctrl_2 7 >;
> +				spin-controller-names = "track_1", "track_2";
> +				queues = < 2 >;
> +
> +				track@30 {
> +					reg = < 0x00000030 0x10 >;
> +				};
> +
> +				track@40 {
> +					reg = < 0x00000040 0x10 >;
> +				};
> +
> +			};
> +		};
> +
> +		lights_1: lights@30000 {
> +			compatible = "ot,work-lights";
> +			reg = < 0x00030000 0x1000 >;
> +			status = "disabled";
> +		};
> +
> +		lights_2: lights@40000 {
> +			compatible = "ot,show-lights";
> +			reg = < 0x00040000 0x1000 >;
> +			status = "disabled";
> +			rate = < 13 138 >;
> +		};
> +
> +		retail_1: vending@50000 {
> +			reg = < 0x00050000 0x1000 >;
> +			compatible = "ot,tickets";
> +			status = "disabled";
> +		};
> +
> +	};
> +};
> +
> diff --git a/drivers/of/unittest-data/testcases.dts b/drivers/of/unittest-data/testcases.dts
> index a85b5e1c381a..04b9e7bb30d9 100644
> --- a/drivers/of/unittest-data/testcases.dts
> +++ b/drivers/of/unittest-data/testcases.dts
> @@ -2,19 +2,15 @@
>  /dts-v1/;
>  /plugin/;
>  
> +#include "testcases_common.dtsi"
> +
>  / {
>  	testcase-data {
> -		changeset {
> -			prop-update = "hello";
> -			prop-remove = "world";
> -			node-remove {
> -			};
> +		testcase-device2 {
> +			compatible = "testcase-device";
> +			interrupt-parent = <&test_intc2>;
> +			interrupts = <1>; /* invalid specifier - too short */
>  		};
>  	};
> +
>  };
> -#include "tests-phandle.dtsi"
> -#include "tests-interrupts.dtsi"
> -#include "tests-match.dtsi"
> -#include "tests-address.dtsi"
> -#include "tests-platform.dtsi"
> -#include "tests-overlay.dtsi"
> diff --git a/drivers/of/unittest-data/testcases_common.dtsi b/drivers/of/unittest-data/testcases_common.dtsi
> new file mode 100644
> index 000000000000..19292bbb4cbb
> --- /dev/null
> +++ b/drivers/of/unittest-data/testcases_common.dtsi
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/ {
> +	testcase-data {
> +		changeset {
> +			prop-update = "hello";
> +			prop-remove = "world";
> +			node-remove {
> +			};
> +		};
> +	};
> +};
> +
> +#include "tests-phandle.dtsi"
> +#include "tests-interrupts.dtsi"
> +#include "tests-match.dtsi"
> +#include "tests-address.dtsi"
> +#include "tests-platform.dtsi"
> +#include "tests-overlay.dtsi"
> diff --git a/drivers/of/unittest-data/tests-interrupts.dtsi b/drivers/of/unittest-data/tests-interrupts.dtsi
> index ec175e800725..0e5914611107 100644
> --- a/drivers/of/unittest-data/tests-interrupts.dtsi
> +++ b/drivers/of/unittest-data/tests-interrupts.dtsi
> @@ -61,12 +61,5 @@ testcase-device1 {
>  			interrupt-parent = <&test_intc0>;
>  			interrupts = <1>;
>  		};
> -
> -		testcase-device2 {
> -			compatible = "testcase-device";
> -			interrupt-parent = <&test_intc2>;
> -			interrupts = <1>; /* invalid specifier - too short */
> -		};
>  	};
> -
>  };
> 

