Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3701832C1DB
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 01:03:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351159AbhCCT3U (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 14:29:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236037AbhCCFWN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Mar 2021 00:22:13 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EABCDC06178A
        for <linux-kbuild@vger.kernel.org>; Tue,  2 Mar 2021 21:21:28 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id i14so3423884pjz.4
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Mar 2021 21:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jGdvbu0FrsOZa6Rq/Yom9taOBE4Ik/ZEHiXZKsv0uRI=;
        b=GPNx/T4z+1ZeuJgxHzD53mXPB6Msnm9jX+CktVmXhjy5egAoDwYonMJ1t3b6OR/UQN
         U77XRK8W3FACHStST2UYo+AqSHpHNJjmSJxKLRJ325itlIlVGxSJFX2JmxoRtZqMpsQt
         wa2TZvE4gCI6E33DPEEa1NGcv1ecJxFDpZGIRWu5KjLMsYG7cWfONDYjewPgH0eBqqJK
         SuhPtKHM7E/9HeavGZBmeIPh3iSDiFSDpCQ8a4A1qnjnWTIYdY/StT/QPmUxj36OWJi9
         gmEDoBUXGY6QocgnfRw5aWsMmzDdLetJPUT3S9BC1sdx+W8UYXCP5PWIBovbu7hz8W3e
         QF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jGdvbu0FrsOZa6Rq/Yom9taOBE4Ik/ZEHiXZKsv0uRI=;
        b=WI2zeMa/kxFeTGHpe6QCa9P9YMpcLTyPyG1//GHmMci84UNxH5jNUAnKn1RWTHB7+p
         jz0hbOsGtTLB/KxwsC2Hvn0ET+i2Lm5OcmNKu1Wc45+a/SeL9QiMwPwykbq0RkyyrHV9
         fQIJ5UlExnTCVjgaC8KbFWxuHSMXVMx4ewrXHNuZjuM5C4VWViNVEuPT7cyLB45wTNpF
         FR/cnOH8kAxPfnfWnJB9j5A+rBFpjEv77AjQZ0EOjyzCDtUJdzyuk7cZ/z/n6TOWyIlj
         kjWqPJ/FBVzIpobUsLbuGkjLNX4IUHlMrK/xznty/lwl20km0L/6GW6sHs6Vj5DbgkdH
         R7Qw==
X-Gm-Message-State: AOAM533L99DMzyCIt8ZnLv+t/lhpq3hVpG9Hybt1J9PGlIl4Lr+0Ha86
        Jz3VRqFaLSyXg0a6Q5ptZA5Y8w==
X-Google-Smtp-Source: ABdhPJw6GlpfyE7P8dvwW1CesEsCPrq8AC/kChySl3CPk8cQ1uYFOq6bzHsnWmMmpc+RdGAWqyi5sQ==
X-Received: by 2002:a17:90a:6342:: with SMTP id v2mr7739878pjs.150.1614748888349;
        Tue, 02 Mar 2021 21:21:28 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id q95sm5314450pjq.20.2021.03.02.21.21.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Mar 2021 21:21:27 -0800 (PST)
Date:   Wed, 3 Mar 2021 10:51:25 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        anmar.oueja@linaro.org, Bill Mills <bill.mills@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH V7 4/6] kbuild: Add support to build overlays (%.dtbo)
Message-ID: <20210303052125.uh32ndnu5d6mem7c@vireshk-i7>
References: <cover.1611904394.git.viresh.kumar@linaro.org>
 <434ba2467dd0cd011565625aeb3450650afe0aae.1611904394.git.viresh.kumar@linaro.org>
 <CAMuHMdVp0vGMqoEoP9A7Y7-ph-DYUWdddtChdq_eZcROYTBMHg@mail.gmail.com>
 <20210205092507.fdxotdjlq5rjs2yh@vireshk-i7>
 <CAMuHMdWUMcMcJxnC+oML8P0+r72_+d6RWGY50dOWCUECdJGWPA@mail.gmail.com>
 <20210205095545.woevnkxg3ar7ctys@vireshk-i7>
 <CAMuHMdXKT3LD3ojMJEg-oHsEKO5TN5P1BTJMyf2fYkhnC8PU=Q@mail.gmail.com>
 <20210205210814.GA3707622@robh.at.kernel.org>
 <02728dac-5666-9c2b-bd46-9c2eabbb2ed8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02728dac-5666-9c2b-bd46-9c2eabbb2ed8@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 24-02-21, 19:32, Frank Rowand wrote:
> I overlooked this and mistakenly thought that the move to .dtbo also
> involved changing to .dtso.  My bad.
> 
> My favorite color here is to use .dtso for the source file that will
> be compiled to create a .dtbo.
> 
> Linus has already accepted patch 4/6 to 5.12-rc1, so changing to .dtso
> will require another patch.

Looks like this is what many people desire, lets do it and make it a
standard even if it wasn't followed earlier.

What about this ?

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index c430fbb36763..0dbedb61835f 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -337,7 +337,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
 
 quiet_cmd_dtc = DTC     $@
 cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
-       $(DTC) -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
+       $(DTC) -I dts -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
                $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
                -d $(depfile).dtc.tmp $(dtc-tmp) ; \
        cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
@@ -348,6 +348,9 @@ $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
 $(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
        $(call if_changed_dep,dtc)
 
+$(obj)/%.dtbo: $(src)/%.dtso $(DTC) FORCE
+       $(call if_changed_dep,dtc)
+
 overlay-y := $(addprefix $(obj)/, $(overlay-y))
 
 quiet_cmd_fdtoverlay = DTOVL   $@
@@ -373,6 +376,9 @@ endef
 $(obj)/%.dt.yaml: $(src)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
        $(call if_changed_rule,dtc,yaml)
 
+$(obj)/%.dt.yaml: $(src)/%.dtso $(DTC) $(DT_TMP_SCHEMA) FORCE
+       $(call if_changed_rule,dtc,yaml)
+
 dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
 
 # Bzip2

-------------------------8<-------------------------

I had to keep the original line as is:

 $(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE

to support the unittest stuff as there are no dtso files there. There
are few things we can do here:

- Don't follow the dtso/dtbo convention for unittest, build files as
  dtb only and everything will continue to work I suppose as
  fdtoverlay won't complain.

- Keep the above line in Makefile, this doesn't sound right, isn't it
  ?

- Make .dts links for unittest file, maybe from the Makefile itself.

- Something else ?

-- 
viresh
