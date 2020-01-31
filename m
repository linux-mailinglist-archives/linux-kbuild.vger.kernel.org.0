Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31E6914F16C
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2020 18:41:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgAaRlB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 31 Jan 2020 12:41:01 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45211 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726712AbgAaRlB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Jan 2020 12:41:01 -0500
Received: by mail-wr1-f65.google.com with SMTP id a6so9585006wrx.12
        for <linux-kbuild@vger.kernel.org>; Fri, 31 Jan 2020 09:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dB53pippwc9Cw99NKYUYznHPUB2hFZaxJZFvVBO7aqs=;
        b=qpA5X10BTpYcTnqANydfOePRDFfM5juSOr2qFtgr27XSiXpOSD0IScgAJEwmmd3JpW
         DUGpMKZH52zTS/SqVObyGMJamkdBaepDzrxfRSKKSx70INGNrdfrqBEybgcz3N3+Trxb
         tprd/87tUYHn7uS2VA4tKsORGaWUnAvXKEJKYKxc4Keq+CSauqjMeo6m+Ah09LWtRfGp
         jqBpJXT8XRN08SMdk8ZdtzHdPYWtsi45xHulVXlPB0Tjx/IrgEpbLeCDeFV61E5iHvvd
         GBTg+gJbhlZtRsq9tomfDlWJ+vJYk2QLTg7E53cAy6ahljt/PvLoiQaWmO/vUtJdyMqU
         ZXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dB53pippwc9Cw99NKYUYznHPUB2hFZaxJZFvVBO7aqs=;
        b=Tm2W1ZWeP22Sd1CIyqG7KsswhSJw9+F+ZP4fcXAN8oqoAbOyLBmo30ozSgidHoGQlF
         pPxtiScfO/VxOihbyoe2VxhjDrDjtp/nmINIFRW0Q3wqVtLBxnSutuXyA6TjKyFfoGMQ
         /yXQ3i0KXtXwsmZi+mq1JWWxtTIQy/j8OaiBRG+PWeyn+p7nOB4Ozc3gfw6GhNGx/gUg
         ptPO0b1Q1FhbHyZpwTeibGf9+OiFwwgbR8dmYdOB3Vo10+s2GDL8BbPT3Vni2vBJHT5d
         qJyx7Cnub0Bn29qewJkJyYbYL+MWuRENVUFF0QeXZcRA7Ic8jT2ec7jPznbhCgLqGb4A
         PScw==
X-Gm-Message-State: APjAAAUO3ul8DXYeVHvvSSC/oVL+Qvd0oeoWyJRP1rDBidnQdmr1O9Sg
        l7cp+t/NH/IMd0P6wuOF/uz11Q==
X-Google-Smtp-Source: APXvYqzMltOxjDFTZz0aISvCEPIjrr/aWK4KPPg5Rh3wcZVfSUAn0hFXxfBWGM5eTwW2w3A8GqAKDA==
X-Received: by 2002:a5d:6a52:: with SMTP id t18mr13205891wrw.391.1580492459005;
        Fri, 31 Jan 2020 09:40:59 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id 21sm11359594wmo.8.2020.01.31.09.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 09:40:58 -0800 (PST)
Date:   Fri, 31 Jan 2020 17:40:55 +0000
From:   Quentin Perret <qperret@google.com>
To:     Matthias Maennich <maennich@google.com>
Cc:     masahiroy@kernel.org, nico@fluxnic.net,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com, jeyu@kernel.org
Subject: Re: [PATCH v2] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
Message-ID: <20200131174055.GA8425@google.com>
References: <20200129181541.105335-1-qperret@google.com>
 <20200131131508.GH102066@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200131131508.GH102066@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Friday 31 Jan 2020 at 13:15:08 (+0000), 'Matthias Maennich' via kernel-team wrote:
> On Wed, Jan 29, 2020 at 06:15:41PM +0000, Quentin Perret wrote:
> > diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> > index a904bf1f5e67..8e1b7f70e800 100755
> > --- a/scripts/adjust_autoksyms.sh
> > +++ b/scripts/adjust_autoksyms.sh
> > @@ -48,6 +48,7 @@ cat > "$new_ksyms_file" << EOT
> > EOT
> > sed 's/ko$/mod/' modules.order |
> > xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
> > +cat - "${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}" |
> 
> This handles absolute paths very well. I wonder whether we can make this
> more useful for folks that want to maintain such a whitelist in their
> copy of the tree. Lets say, I have in my sources
> arch/x86/configs/x86_64_symbol_whitelist and in my config I have
> CONFIG_UNUSED_KSYMS_WHITELIST="arch/x86/configs/x86_64_symbol_whitelist".
> 
> If I see it correctly, UNUSED_KSYMS_WHITELIST is currently either an
> absolute path or a relative path to the current build directory. I would
> prefer if relative paths would be relative to the source directory to
> support the above use case. (Note, that scenario above works if I build
> directly in the sources, but fails if I build O=/somewhere/else.)

Right, that is an interesting use case. I suppose something like the
below should work (with appropriate documentation of the config option).

---8<---
diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
index 8e1b7f70e800..d37803fd75ce 100755
--- a/scripts/adjust_autoksyms.sh
+++ b/scripts/adjust_autoksyms.sh
@@ -38,6 +38,12 @@ esac
 # We need access to CONFIG_ symbols
 . include/config/auto.conf
 
+ksym_wl="${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}"
+# If the path is relative, it must be relative to the source tree
+if [ "$ksym_wl" == "${ksym_wl#/}" ]; then
+       ksym_wl="$abs_srctree/$ksym_wl"
+fi
+
 # Generate a new ksym list file with symbols needed by the current
 # set of modules.
 cat > "$new_ksyms_file" << EOT
@@ -48,7 +54,7 @@ cat > "$new_ksyms_file" << EOT
 EOT
 sed 's/ko$/mod/' modules.order |
 xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
-cat - "${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}" |
+cat - "$ksym_wl" |
 sort -u |
 sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
--->8---

Thoughts ?

Thanks,
Quentin
