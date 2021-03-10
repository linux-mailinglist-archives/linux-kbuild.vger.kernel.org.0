Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D596D333493
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Mar 2021 05:55:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbhCJEy2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Mar 2021 23:54:28 -0500
Received: from mail-ed1-f51.google.com ([209.85.208.51]:32952 "EHLO
        mail-ed1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbhCJEyS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Mar 2021 23:54:18 -0500
Received: by mail-ed1-f51.google.com with SMTP id x9so25573976edd.0;
        Tue, 09 Mar 2021 20:54:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UR9GHogTuwPfg1420rnBVKlRPMMG6gjYMkZ67S2OdAw=;
        b=b2rlao6BajEqKnmXf6ySIHEGpHetzcR00i6jLVwqC9RmJz02HkqLJY2h1whFCnuXNR
         lLyfwsUB6ioWqNTUi0nORSmhTlYfF/Z4LFT433edEXK4FOlOu1PdNNVHQHPMT1WLHtyz
         oRSSzBER6TZ1++AulAhDjzRoAvtKVYVAsqG6VnjWr26V7gCgEeCHu2nTxKC39Oaukd4r
         sepR3l1mgI2FyRLnGODcoo9bggBPl5QOC7XdxG7bAGtArjdTcpdTEYggOlbPxir9r/Me
         UCxLEYB8w6rjULvYUKLvcQMjSluICUD8lcOHr68eg35AMINBGr2dYvt9wSZdwUqYhSGg
         J+Pw==
X-Gm-Message-State: AOAM533kj9YeJBypqZ8LZcowhpTmh7MKbv0NS9JRLM43udfEGuauksey
        uHAGVHRenypm4msPs6Eih2AXCVNLJ9k=
X-Google-Smtp-Source: ABdhPJxCh6TyyGmaFur42C7mRiPhg6HA/f6AOfNXSKl4jCb3a61y0OMyfuLUh82WqDpOleJwyiGYMg==
X-Received: by 2002:aa7:d2d5:: with SMTP id k21mr1131656edr.216.1615352056675;
        Tue, 09 Mar 2021 20:54:16 -0800 (PST)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id v11sm10016760eds.14.2021.03.09.20.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Mar 2021 20:54:15 -0800 (PST)
Subject: Re: [PATCH] kbuild: dummy-tools: adjust to scripts/cc-version.sh
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Jiri Slaby <jirislaby@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Philipp Rudo <prudo@linux.ibm.com>,
        linux-kernel@vger.kernel.org
References: <20210309162545.637647-1-masahiroy@kernel.org>
From:   Jiri Slaby <jirislaby@kernel.org>
Message-ID: <87f93105-926a-d81b-3226-c5147870d62a@kernel.org>
Date:   Wed, 10 Mar 2021 05:54:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210309162545.637647-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 09. 03. 21, 17:25, Masahiro Yamada wrote:
> Commit aec6c60a01d3 ("kbuild: check the minimum compiler version in
> Kconfig") changed how the script detects the compiler version.
> 
> Get 'make CROSS_COMPILE=scripts/dummy-tools/' back working again.
> 
> Fixes: aec6c60a01d3 ("kbuild: check the minimum compiler version in Kconfig")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
> Perhaps, Jiri may have already noticed this issue, and have a similar patch.
> I just checked ML, but I did not find a patch to fix this.

No, as I was making it work on 5.11 :).

BTW there is one remaining issue I came across:
config PAHOLE_HAS_SPLIT_BTF
         def_bool $(success, test `$(PAHOLE) --version | sed -E 
's/v([0-9]+)\.([0-9]+)/\1\2/'` -ge "119")

and in Makefile we see:
PAHOLE          = pahole

and not something like:
PAHOLE          = $(CROSS_COMPILE)pahole

Any idea how to fix this?

>   scripts/dummy-tools/gcc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/dummy-tools/gcc b/scripts/dummy-tools/gcc
> index 7b10332b23ba..39e65fee59bd 100755
> --- a/scripts/dummy-tools/gcc
> +++ b/scripts/dummy-tools/gcc
> @@ -57,9 +57,9 @@ if arg_contain --version "$@"; then
>   fi
>   
>   if arg_contain -E "$@"; then
> -	# For scripts/gcc-version.sh; This emulates GCC 20.0.0
> +	# For scripts/cc-version.sh; This emulates GCC 20.0.0
>   	if arg_contain - "$@"; then
> -		sed 's/^__GNUC__$/20/; s/^__GNUC_MINOR__$/0/; s/^__GNUC_PATCHLEVEL__$/0/'
> +		sed -n '/^GCC/{s/__GNUC__/20/; s/__GNUC_MINOR__/0/; s/__GNUC_PATCHLEVEL__/0/; p;}'
>   		exit 0
>   	else
>   		echo "no input files" >&2
> 


-- 
js
suse labs
