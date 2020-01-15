Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DAD713C935
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jan 2020 17:25:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728909AbgAOQZy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 15 Jan 2020 11:25:54 -0500
Received: from jack.einval.com ([84.45.184.145]:37052 "EHLO mail.einval.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726483AbgAOQZy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Jan 2020 11:25:54 -0500
X-Greylist: delayed 1784 seconds by postgrey-1.27 at vger.kernel.org; Wed, 15 Jan 2020 11:25:53 EST
Received: from steve by mail.einval.com with local (Exim 4.92)
        (envelope-from <steve@einval.com>)
        id 1irl1W-00082F-CF; Wed, 15 Jan 2020 15:56:02 +0000
From:   Steve McIntyre <steve.mcintyre@linaro.org>
To:     alexandre.torgue@st.com
Subject: Re: [RFC PATCH 0/3] Add device tree build information
In-Reply-To: <20200113181625.3130-1-alexandre.torgue@st.com>
Cc:     <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org
Message-Id: <E1irl1W-00082F-CF@mail.einval.com>
Date:   Wed, 15 Jan 2020 15:56:02 +0000
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Alexandre!

alexandre.torgue@st.com wrote:
>
>The goal of this series is to add device tree build information in dtb.
>This information can be dtb build date, where devicetree files come from,
>who built the dtb ... Actually, same kind of information that you can find
>in the Linux banner which is printout during kernel boot. Having the same
>kind of information for device tree is useful for debugging and maintenance.
>
>To achieve that a new option "-B" (using an argument) is added to dtc. 
>The argument is a file containing a string with build information
>(e.g., From Linux 5.5.0-rc1 by alex the Mon Jan 13 18:25:38 CET 2020).
>DTC use it to append dts file with a new string property "Build-info".
>
>of/fdt.c is modified to printout "Build-info" property during Kernel boot and 
>scripts/Makefile.lib is modified to use dtc -B option during kernel make (this
>last part could be improved for sure).
>
>Regards
>Alex
>
>Alexandre Torgue (3):
>  dtc: Add dtb build information option
>  of: fdt: print dtb build information
>  scripts: Use -B dtc option to generate dtb build information.
>
> drivers/of/fdt.c           |  9 +++++++
> scripts/Makefile.lib       | 11 +++++---
> scripts/dtc/dtc.c          | 55 +++++++++++++++++++++++++++++++++-----
> scripts/gen_dtb_build_info | 11 ++++++++
> 4 files changed, 76 insertions(+), 10 deletions(-)
> create mode 100755 scripts/gen_dtb_build_info

Looks good to me in testing here:

[    0.000000] OF: fdt: From Linux 5.5.0-rc6-00031-g95e20af9fb9c-dirty by stemci01 the Wed 15 Jan 14:33:25 GMT 2020.

Tested-By: Steve McIntyre <steve.mcintyre@linaro.org>

-- 
Steve McIntyre                                steve.mcintyre@linaro.org
<http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs
