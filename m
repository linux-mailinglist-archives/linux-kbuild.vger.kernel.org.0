Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B70C214ED0E
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2020 14:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728610AbgAaNPM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 31 Jan 2020 08:15:12 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39553 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728544AbgAaNPL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Jan 2020 08:15:11 -0500
Received: by mail-wr1-f65.google.com with SMTP id y11so8550027wrt.6
        for <linux-kbuild@vger.kernel.org>; Fri, 31 Jan 2020 05:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pMGTkZejcRbIEhm2Fn/SJPdUwbiAKkh35s6KFA9Xsfc=;
        b=qTWgpBB//UBaXqSy1KCaPJm3JRr8VTZAggnZ65FCrQvJlKu+0+Bi5mvlq9DAa6CdKV
         ff2IQffeB5LC4ayEaBByrsHIRuplJMMM0hFhpAg6dzRxWUm93X9F5yk6Nm1hmChUYBxj
         /pQralfyEIgACFznJA0cucQmE7eOl3WS41WZ1QpuMEYenS+jwYP1QSN7KzCtntd5V6hN
         A6/BELU+d/IA8hVP/UPG3/6mDCU1p9EYjVjmCTy96WvA1XF6gZZAL1TY2p78s91t/+73
         qFtj09OUOUy3ciHpEeaNFdMp41wzM3UX6Rn6KCBTBHe9dFN+UbIibTOGlMAEaqAbUXma
         9dAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pMGTkZejcRbIEhm2Fn/SJPdUwbiAKkh35s6KFA9Xsfc=;
        b=gMXuE8OOR6hq+367awHSA3tc7m/N1jqqcV4ya+nbXZbXBerAWjlRlR9doqNFonZpcC
         sYye72lpppkKi+WXlcJqaUpm+lZLyYzHDzvkxzpR/3a48qqyVq91xAZUWHt8IHrtCRtc
         TZo1mKQI4f4gi7C5TejEBNkMFr6q6zvgQyy+c32uUhW6ppJwZQaE2CJAuUYc5oQYs+wq
         ezbCWbjIalVIfx4MKpkq0H/ENZMz1tZBA+Z6ycDB5Iwx6i+VS4r1omzcAYdzAAMKE0yh
         uvv3cTkUvGEqNQDfDtAM6rDu9rIjYtSWgXdShk2mWPYt06cXUGtCrmwXcDLdMmjirYCr
         Z2xQ==
X-Gm-Message-State: APjAAAXEFTOkc45D3s1V5xhZiDxDYaT294oOmZPoQlM1fIJSj8rS4Lj3
        6fDS9hI/axWBja+wTZ2dE1y9wA==
X-Google-Smtp-Source: APXvYqza3VJEYJdQsvtDfjodgx6fnJIGuz4s4bY1cHROAVO1TCq3QQ7h5PXi7tRAgNOEV6DLEzywug==
X-Received: by 2002:adf:9c92:: with SMTP id d18mr579870wre.82.1580476509291;
        Fri, 31 Jan 2020 05:15:09 -0800 (PST)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
        by smtp.gmail.com with ESMTPSA id s65sm11218013wmf.48.2020.01.31.05.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 05:15:08 -0800 (PST)
Date:   Fri, 31 Jan 2020 13:15:08 +0000
From:   Matthias Maennich <maennich@google.com>
To:     Quentin Perret <qperret@google.com>
Cc:     masahiroy@kernel.org, nico@fluxnic.net,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com, jeyu@kernel.org
Subject: Re: [PATCH v2] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
Message-ID: <20200131131508.GH102066@google.com>
References: <20200129181541.105335-1-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200129181541.105335-1-qperret@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 29, 2020 at 06:15:41PM +0000, Quentin Perret wrote:
>CONFIG_TRIM_UNUSED_KSYMS currently removes all unused exported symbols
>from ksymtab. This works really well when using in-tree drivers, but
>cannot be used in its current form if some of them are out-of-tree.
>
>Indeed, even if the list of symbols required by out-of-tree drivers is
>known at compile time, the only solution today to guarantee these don't
>get trimmed is to set CONFIG_TRIM_UNUSED_KSYMS=n. This not only wastes
>space, but also makes it difficult to control the ABI usable by vendor
>modules in distribution kernels such as Android. Being able to control
>the kernel ABI surface is particularly useful to ship a unique Generic
>Kernel Image (GKI) for all vendors.
>
>As such, attempt to improve the situation by enabling users to specify a
>symbol 'whitelist' at compile time. Any symbol specified in this
>whitelist will be kept exported when CONFIG_TRIM_UNUSED_KSYMS is set,
>even if it has no in-tree user. The whitelist is defined as a simple
>text file, listing symbols, one per line.

Thank you for working on this! I like the idea!

>
>Signed-off-by: Quentin Perret <qperret@google.com>
>
>---
>v2: make sure to quote the whitelist path properly (Nicolas)
>---
> init/Kconfig                | 12 ++++++++++++
> scripts/adjust_autoksyms.sh |  1 +
> 2 files changed, 13 insertions(+)
>
>diff --git a/init/Kconfig b/init/Kconfig
>index a34064a031a5..d9c977ef7de5 100644
>--- a/init/Kconfig
>+++ b/init/Kconfig
>@@ -2180,6 +2180,18 @@ config TRIM_UNUSED_KSYMS
>
> 	  If unsure, or if you need to build out-of-tree modules, say N.
>
>+config UNUSED_KSYMS_WHITELIST
>+	string "Whitelist of symbols to keep in ksymtab"
>+	depends on TRIM_UNUSED_KSYMS
>+	help
>+	  By default, all unused exported symbols will be trimmed from the
>+	  build when TRIM_UNUSED_KSYMS is selected.
>+
>+	  UNUSED_KSYMS_WHITELIST allows to whitelist symbols that must be kept
>+	  exported at all times, even in absence of in-tree users. The value to
>+	  set here is the path to a text file containing the list of symbols,
>+	  one per line.
>+
> endif # MODULES
>
> config MODULES_TREE_LOOKUP
>diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
>index a904bf1f5e67..8e1b7f70e800 100755
>--- a/scripts/adjust_autoksyms.sh
>+++ b/scripts/adjust_autoksyms.sh
>@@ -48,6 +48,7 @@ cat > "$new_ksyms_file" << EOT
> EOT
> sed 's/ko$/mod/' modules.order |
> xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
>+cat - "${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}" |

This handles absolute paths very well. I wonder whether we can make this
more useful for folks that want to maintain such a whitelist in their
copy of the tree. Lets say, I have in my sources
arch/x86/configs/x86_64_symbol_whitelist and in my config I have
CONFIG_UNUSED_KSYMS_WHITELIST="arch/x86/configs/x86_64_symbol_whitelist".

If I see it correctly, UNUSED_KSYMS_WHITELIST is currently either an
absolute path or a relative path to the current build directory. I would
prefer if relative paths would be relative to the source directory to
support the above use case. (Note, that scenario above works if I build
directly in the sources, but fails if I build O=/somewhere/else.)

Cheers,
Matthias

> sort -u |
> sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
>
>-- 
>2.25.0.341.g760bfbb309-goog
>
