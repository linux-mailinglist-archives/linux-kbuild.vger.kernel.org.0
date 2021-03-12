Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1A5B3384C4
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 05:48:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231883AbhCLEru (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 23:47:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbhCLErQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 23:47:16 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21E27C061574
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 20:47:16 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id x7so1019643pfi.7
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 20:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pkncJmcaGxJTHzTzrvFVmek8LsrIaoR+xjf9Ti26Ntw=;
        b=Wkp9wxLuIQAnuHG7p+IfJpjo4QfSiH4lnF+spHBcoP7RZuyUTzmf9l+57FJAPmTgsY
         w8slMY0C8NbH+v5DR9azD8K+o0utl53s7SWT9Wa4bxPDRFgdeUBZTbSq/0MsLLYba2LO
         GoGGtjJEZruvL/otKb7qvUGQZTOkY9Df5p/x2H5M3VDDStSdgjs+HcvNfI/9yjkK7I8O
         9aGigWpjZI4rOrtyssNgOSRLYRdUOFjoFws1T0BnowQjzNeIKLXPlCZsWqaEtCCpM+kB
         IuZ0DJeMKg+IEXBrrcJlmTzK0p+yJ3zcsGiak/r56OFrCv0PZjADyOdaMR5fERqGfHdC
         z44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pkncJmcaGxJTHzTzrvFVmek8LsrIaoR+xjf9Ti26Ntw=;
        b=pEFzE7n+wNHfj04xadD7nuGcSoQTSsfqmHV7GlO6K4kE0Ffe+4Xg54mn4KCMbNdiCe
         rAOHwNOhyuvcZMiPcFHUIQeicwQZ8d2Egg149obUsTwC1QFLgvwm1frZOwNfsvqc9jET
         Dn5J+GuGO3fDJ9NnrbTuK2o4i3bvirJATzOdrefvzBB1piJQ5PlOHJtV7zh+VZ77lDep
         FSB6emyeTg+qN0sj0fuc0SETfKH/jysZOOcw6qlXPPoe9P3MibwuGTb99cyZxgOMsdKx
         4tlt41GOGTNqIUTMjKhZNka9KRkXheEO/iOUy+QUvNnL/4AMKYwB0xsjT6qH5rXQJu7K
         YcAw==
X-Gm-Message-State: AOAM533qXu++B93vxcwD9AMmVYX1R1WVxKyhzojBTJjxusboh+CvBGwp
        5OVHnvsDCtjVBvEWqHSy0gGZRw==
X-Google-Smtp-Source: ABdhPJz+QCwOrw0dtS8GDdOZTHZ8lebF0EgXWjxU7v10xfdzdj5vwLHrUTSK/Fb9BdDMhTkYtvf9gw==
X-Received: by 2002:a63:5952:: with SMTP id j18mr10309622pgm.397.1615524435554;
        Thu, 11 Mar 2021 20:47:15 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id w28sm3724212pfi.119.2021.03.11.20.47.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Mar 2021 20:47:14 -0800 (PST)
Date:   Fri, 12 Mar 2021 10:17:12 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V11 3/5] kbuild: Allow .dtso format for overlay source
 files
Message-ID: <20210312044712.srmqfuie7fae55pb@vireshk-i7>
References: <cover.1615354376.git.viresh.kumar@linaro.org>
 <170e086a5fa076869e7b37de8eea850fa7c39118.1615354376.git.viresh.kumar@linaro.org>
 <CAK7LNASACr5EaG9j5c-eD3bYxKgrisb60Z3Qy7UsyS-i9YjORg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASACr5EaG9j5c-eD3bYxKgrisb60Z3Qy7UsyS-i9YjORg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10-03-21, 20:24, Masahiro Yamada wrote:
> Even without "-I dts",
> 
>    inform = guess_input_format(arg, "dts");
> 
> seems to fall back to "dts" anyway,
> but I guess you wanted to make this explicit, correct?


> > +# Required for of unit-test files as they can't be renamed to .dtso
> 
> If you go with *.dtso, I think you will rename
> all *.dts under the drivers/ directory.
> 
> What is blocking you from making this consistent?

What about this patch instead ? This localizes the dts->dtbo hack to
unitest's Makefile at least.

diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
index a5d2d9254b2c..9f3426ec3fab 100644
--- a/drivers/of/unittest-data/Makefile
+++ b/drivers/of/unittest-data/Makefile
@@ -86,3 +86,7 @@ static_test_1-dtbs := static_base_1.dtb $(apply_static_overlay_1)
 static_test_2-dtbs := static_base_2.dtb $(apply_static_overlay_2)
 
 dtb-$(CONFIG_OF_OVERLAY) += static_test_1.dtb static_test_2.dtb
+
+# Required for of unittest files as they can't be renamed to .dtso
+$(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
+       $(call if_changed_dep,dtc)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index bc045a54a34e..77a9be055e51 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -347,7 +347,7 @@ cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ;
 $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
        $(call if_changed_dep,dtc)
 
-$(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
+$(obj)/%.dtbo: $(src)/%.dtso $(DTC) FORCE
        $(call if_changed_dep,dtc)
 
 overlay-y := $(addprefix $(obj)/, $(overlay-y))
@@ -375,6 +375,9 @@ endef
 $(obj)/%.dt.yaml: $(src)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
        $(call if_changed_rule,dtc,yaml)
 
+$(obj)/%.dt.yaml: $(src)/%.dtso $(DTC) $(DT_TMP_SCHEMA) FORCE
+       $(call if_changed_rule,dtc,yaml)
+
 dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
 
 # Bzip2

-- 
viresh
