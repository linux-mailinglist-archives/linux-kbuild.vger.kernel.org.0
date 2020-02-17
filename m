Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76FFA1615FF
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2020 16:22:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728698AbgBQPWG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Feb 2020 10:22:06 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34355 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728428AbgBQPWG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Feb 2020 10:22:06 -0500
Received: by mail-wr1-f68.google.com with SMTP id n10so18261677wrm.1
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Feb 2020 07:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IUWp4SkyLItoviNWg0X5RFOhBbayzqtWbjEcxmFScDY=;
        b=vmX0bhk8RT87WRMMTfXKylvEUBqgF04aBWw4VMbFI/Px/MCSycqwFBu1CXnE1S9/gE
         u1vgJMC7Fk5fSbEJvfaQgTj/vXCxMRSrMLw2uKJOhpJNdWBPiXijg9zLzOTShMAgFoUV
         oOunjY3RY/XW20FVT6FE5vx6ZeNfouB/57K4eC3V89k8T+HRybbT2o3YoYhP2jyMxGgf
         AkouZDCiFULTKy/OyyT0C9x20vc2CQ2s4G67U8Jhtl7ifDkGG1OsD+7HyXnrnhfpVEo8
         c+ntfhUWjUlq6ijf1rL2rfcE+V/V1pPaIZf1MA0M46ntz202XOWUsu3tLznGiqWKlaEV
         NQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IUWp4SkyLItoviNWg0X5RFOhBbayzqtWbjEcxmFScDY=;
        b=ImJLZ+c2QsTh3U8Dv/y1LCnAgFG/lsbL8AGE8oN/w5FnRorOFNHl+t53O0rHbgPnuz
         uVCoaTKHw53BacKMnoSFLdx1O5Dmxn3xT+w5H9QW83gtfHc9w7glBOgzKyVT6XqsCUKh
         FQoTUi1U935cRXv5TVQ2L2lgRmFjYVfl7l2J3QGr4koqZdgMFpVeABFRgPVz11aLE+D/
         jkkbHw0BNzbc1LZWlqtg0rsvvV1vlJZAyJdq3ym/Y1NIyKV4VMzBH7A7i8UrJl5h8VPU
         kYMhrJbAHejBs4NwYz8oqm45bOqmfoZYzPS3/i55vl6zmRv6cBuE2zY7b1oY/diWdAfd
         7RyA==
X-Gm-Message-State: APjAAAWe35eQMP/bh49EwyuuMRlOwJKR27dv9UxWcd/xHlw/h5BFzWqw
        rAiJHYos0vfm+ZO/MKFnTDNzgg==
X-Google-Smtp-Source: APXvYqyuzXAEKIZ2Iggaow7Mc6V5fRxLyJ3pWxkqWapxgVcsW4GOwS7+a45ndtWghwTveGRlPN4zYA==
X-Received: by 2002:adf:ecd0:: with SMTP id s16mr22245577wro.325.1581952922518;
        Mon, 17 Feb 2020 07:22:02 -0800 (PST)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
        by smtp.gmail.com with ESMTPSA id q1sm1491719wrw.5.2020.02.17.07.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 07:22:01 -0800 (PST)
Date:   Mon, 17 Feb 2020 15:22:01 +0000
From:   Matthias Maennich <maennich@google.com>
To:     Quentin Perret <qperret@google.com>
Cc:     masahiroy@kernel.org, nico@fluxnic.net,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com, jeyu@kernel.org, hch@infradead.org
Subject: Re: [PATCH v4 1/3] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
Message-ID: <20200217152201.GA48466@google.com>
References: <20200212202140.138092-1-qperret@google.com>
 <20200212202140.138092-2-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200212202140.138092-2-qperret@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 12, 2020 at 08:21:38PM +0000, Quentin Perret wrote:
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
>Kernel Image (GKI) for all vendors, which is a first step in the
>direction of getting all vendors to contribute their code upstream.
>
>As such, attempt to improve the situation by enabling users to specify a
>symbol 'whitelist' at compile time. Any symbol specified in this
>whitelist will be kept exported when CONFIG_TRIM_UNUSED_KSYMS is set,
>even if it has no in-tree user. The whitelist is defined as a simple
>text file, listing symbols, one per line.
>
>Acked-by: Jessica Yu <jeyu@kernel.org>
>Signed-off-by: Quentin Perret <qperret@google.com>
>---
> init/Kconfig                | 13 +++++++++++++
> scripts/adjust_autoksyms.sh |  5 +++++
> 2 files changed, 18 insertions(+)
>
>diff --git a/init/Kconfig b/init/Kconfig
>index cfee56c151f1..58b672afceb2 100644
>--- a/init/Kconfig
>+++ b/init/Kconfig
>@@ -2210,6 +2210,19 @@ config TRIM_UNUSED_KSYMS
>
> 	  If unsure, or if you need to build out-of-tree modules, say N.
>
>+config UNUSED_KSYMS_WHITELIST
>+	string "Whitelist of symbols to keep in ksymtab"
>+	depends on TRIM_UNUSED_KSYMS
>+	help
>+	  By default, all unused exported symbols will be un-exported from the
>+	  build when TRIM_UNUSED_KSYMS is selected.
>+
>+	  UNUSED_KSYMS_WHITELIST allows to whitelist symbols that must be kept
>+	  exported at all times, even in absence of in-tree users. The value to
>+	  set here is the path to a text file containing the list of symbols,
>+	  one per line. The path can be absolute, or relative to the kernel
>+	  source tree.
>+
> endif # MODULES
>
> config MODULES_TREE_LOOKUP
>diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
>index a904bf1f5e67..93f4d10e66e6 100755
>--- a/scripts/adjust_autoksyms.sh
>+++ b/scripts/adjust_autoksyms.sh
>@@ -38,6 +38,10 @@ esac
> # We need access to CONFIG_ symbols
> . include/config/auto.conf
>
>+# Use 'eval' to expand the whitelist path and check if it is relative
>+eval ksym_wl="${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}"
>+[ "${ksym_wl:0:1}" = "/" ] || ksym_wl="$abs_srctree/$ksym_wl"
>+
> # Generate a new ksym list file with symbols needed by the current
> # set of modules.
> cat > "$new_ksyms_file" << EOT
>@@ -48,6 +52,7 @@ cat > "$new_ksyms_file" << EOT
> EOT
> sed 's/ko$/mod/' modules.order |
> xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
>+cat - "$ksym_wl" |

In case the whitelist file can't be found, the error message is

  cat: path/to/file: file not found

I wonder whether we can make this error message a bit more specific by
telling the user that the KSYMS_WHITELIST is missing.

With the above addressed (and your amend for the absolute path test),
please feel free to add

Tested-by: Matthias Maennich <maennich@google.com>
Reviewed-by: Matthias Maennich <maennich@google.com>

Cheers,
Matthias

> sort -u |
> sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
>
>-- 
>2.25.0.225.g125e21ebc7-goog
>
