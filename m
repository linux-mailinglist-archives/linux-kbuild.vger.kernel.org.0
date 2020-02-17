Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28CB0161803
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2020 17:35:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728778AbgBQQfA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Feb 2020 11:35:00 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41582 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728924AbgBQQfA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Feb 2020 11:35:00 -0500
Received: by mail-wr1-f65.google.com with SMTP id c9so20533242wrw.8
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Feb 2020 08:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MqBQs9mU4SVVBLSutJvTaQI0oZjEsyaLtHu9rwR0Mts=;
        b=qRvYrvD7yOsh2/8dCM2lAVd8q7jEXhhFgspj0IrG3z3AL18Wj4rVmyUqF/juKM5A2R
         6JHP7SuW5uRdagaIwmnuE43s1TT5lj7KSY2czGQCVsKnYz8dmhJMj2nbgWqM0A+clUay
         v4HKWE7f8hvHbNxNO0ko3um4kopuL9sE56+KS1kG20Bu6eo/NMSHNgq8G2O6kBNXtVXA
         lAXRUFindJHxm9YkTt5BdivaRAxx7tTx0zwoJQUq98VfoxLCwj5sK++WpZ8ct3H7ANT7
         pmdVs3Ro5b1k/JLwkcIwmZOzXEtOdISZPmwBF+eqCuhS9sW4+4k524kIMJ+OuBzNkmmy
         TNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MqBQs9mU4SVVBLSutJvTaQI0oZjEsyaLtHu9rwR0Mts=;
        b=nwhIqeO6OSCUqrogluIU9MTuaBHmKoMmL7/rskaLyjyXQ8CLnDvk1irPnMdnBRmb8m
         0rNHpl6NvpZ1f9MpWsIvHD+nDQRM904CNN1z4UgkFmKSHzAT4jVwT64C4ahFwHkCuiBb
         u1hTfJ98AEb69cTX+VOBtxgyhcNiqEg1NhdPiOldaGK8bOR/U/5TM+bAJyw03SR194EN
         TCd4+Qpt+qjVqHpyxXlSyPkZ4nMy8HNVNfvd9mJ5HJHrhVgPJnQSE/bhMbv8mtD2ZDYB
         OscTfflhxNNMIl5ip8cg0W4Aq+4BbJDGij0UvxFXaucwBU6v4PhhEAhjXLpvrhjT1puL
         0JFg==
X-Gm-Message-State: APjAAAW3+Q9SZfmr3ltlKWzZDqH8t1R5ii+TrdeCXPAfz5xdsj3/KvuB
        DhBvya42H8VmWWEql098PklSYQ==
X-Google-Smtp-Source: APXvYqzdibfMQ0dKZdf0c3/jSs9VvhQJxWxcfIQUSqWqDnz18PMUr/RtrXlatqFz59qzGUR1ToMkfQ==
X-Received: by 2002:a5d:5044:: with SMTP id h4mr21909158wrt.4.1581957298080;
        Mon, 17 Feb 2020 08:34:58 -0800 (PST)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
        by smtp.gmail.com with ESMTPSA id f1sm1686139wro.85.2020.02.17.08.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 08:34:57 -0800 (PST)
Date:   Mon, 17 Feb 2020 16:34:57 +0000
From:   Matthias Maennich <maennich@google.com>
To:     Quentin Perret <qperret@google.com>
Cc:     masahiroy@kernel.org, nico@fluxnic.net,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com, jeyu@kernel.org, hch@infradead.org
Subject: Re: [PATCH v4 3/3] kbuild: generate autoksyms.h early
Message-ID: <20200217163457.GC48466@google.com>
References: <20200212202140.138092-1-qperret@google.com>
 <20200212202140.138092-4-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200212202140.138092-4-qperret@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 12, 2020 at 08:21:40PM +0000, Quentin Perret wrote:
>When doing a cold build, autoksyms.h starts empty, and is updated late
>in the build process to have visibility over the symbols used by in-tree
>drivers. But since the symbol whitelist is known upfront, it can be used
>to pre-populate autoksyms.h and maximize the amount of code that can be
>compiled to its final state in a single pass, hence reducing build time.
>
>Do this by using gen_autoksyms.sh to initialize autoksyms.h instead of
>creating an empty file.
>
>Signed-off-by: Quentin Perret <qperret@google.com>

Reviewed-by: Matthias Maennich <maennich@google.com>
Tested-by: Matthias Maennich <maennich@google.com>

Cheers,
Matthias

>---
> Makefile                 | 7 +++++--
> scripts/gen_autoksyms.sh | 3 ++-
> 2 files changed, 7 insertions(+), 3 deletions(-)
>
>diff --git a/Makefile b/Makefile
>index 84b71845c43f..17b7e7f441bd 100644
>--- a/Makefile
>+++ b/Makefile
>@@ -1062,9 +1062,12 @@ endif
>
> autoksyms_h := $(if $(CONFIG_TRIM_UNUSED_KSYMS), include/generated/autoksyms.h)
>
>+quiet_cmd_autoksyms_h = GEN     $@
>+      cmd_autoksyms_h = mkdir -p $(dir $@); $(CONFIG_SHELL) \
>+			$(srctree)/scripts/gen_autoksyms.sh $@
>+
> $(autoksyms_h):
>-	$(Q)mkdir -p $(dir $@)
>-	$(Q)touch $@
>+	$(call cmd,autoksyms_h)
>
> ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
>
>diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
>index 2cea433616a8..f52b93ad122c 100755
>--- a/scripts/gen_autoksyms.sh
>+++ b/scripts/gen_autoksyms.sh
>@@ -32,7 +32,8 @@ cat > "$output_file" << EOT
>
> EOT
>
>-sed 's/ko$/mod/' modules.order |
>+[ -f modules.order ] && modlist=modules.order || modlist=/dev/null
>+sed 's/ko$/mod/' $modlist |
> xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
> cat - "$ksym_wl" |
> sort -u |
>-- 
>2.25.0.225.g125e21ebc7-goog
>
