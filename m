Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D68E151C75
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2020 15:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727267AbgBDOoT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Feb 2020 09:44:19 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33204 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727257AbgBDOoT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Feb 2020 09:44:19 -0500
Received: by mail-wm1-f68.google.com with SMTP id m10so2368105wmc.0
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Feb 2020 06:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1IXHtRUMShcVj0I7kyO/iiIdumIO9Jb0cIQ8fggcE/4=;
        b=GASTvG1JvEAbAvzsvUyAnc3ILW1Gx+26xA3ilwVyNL7T33tvt+Lz5T2gHkQPZXm+kq
         M1TPCQg4XHeftf3cfLN8TJFcwJsa+OXXLIlgNSpQNM36YUFxwfDnsFfmz7GtEi8tPzYA
         rlqjkZUaW7PWBT3yBPOPhJheNAmu0zqG5S5P9Eo49PSjSVTv5QF/hqWT+5nXzlw7u8ky
         EvBF2KfkLmhLnfxJ1wiqTQA6OCdxfx0ADM4CDYsfMGiw443gGHSHkTWTTTUzj5g0GUyq
         7kZfvBkoMdsBz0BmnkdIGi8R30GNOZpJs+LZXbdwrii7WtNsp6N+s30vOjRbyc6xz05e
         1skA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1IXHtRUMShcVj0I7kyO/iiIdumIO9Jb0cIQ8fggcE/4=;
        b=XCmbcbQCb1CfnOl6XeXocRC9qzexC6f8jXaiTxMhTYpnXi/hgM1aQqCSkosaFIoYsp
         XU6kVkuPBMljdA32il2z8AULMeZL8XjvEOb2fqnBmh+lb1c5vMXJ1z+ZR/+QEzyfvDAF
         on1ZXaRwKDZRPoUGFnOuOFk9uUgo+zOEridDkIRIHBSXnt+Bvkf1zA6BppirZR6vbHhe
         46QM+HacZSfLHLgGvdlum1utjwVbgLK8B/9RU3064c0qPYT736IcR8wMAGh5VqWAhJOU
         DnYQvhXqOnTcoEzUHKSh7MHkP9qq++DquZ+bfAyP/WE3YGoHap8HRN8/OMfDWs6/YMy3
         ncBQ==
X-Gm-Message-State: APjAAAVDuvbKXeJKxiZBC9NmCOrXg0MVhgic2WTZyhYIDXspuq6X3eoK
        ivafOYw5CjRjHhBSqnQx0cknjA==
X-Google-Smtp-Source: APXvYqzVi62MG4N9AgDN5RDsH5ZMtz54CCua+ACBsaV+ksCH9ExoaI8R+1bNIuPw67s5CtrWxt1jAQ==
X-Received: by 2002:a7b:c759:: with SMTP id w25mr6083222wmk.15.1580827456175;
        Tue, 04 Feb 2020 06:44:16 -0800 (PST)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
        by smtp.gmail.com with ESMTPSA id c9sm3962843wmc.47.2020.02.04.06.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 06:44:15 -0800 (PST)
Date:   Tue, 4 Feb 2020 14:44:15 +0000
From:   Matthias Maennich <maennich@google.com>
To:     Quentin Perret <qperret@google.com>
Cc:     masahiroy@kernel.org, nico@fluxnic.net,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com, jeyu@kernel.org
Subject: Re: [PATCH v2] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
Message-ID: <20200204144415.GC42496@google.com>
References: <20200129181541.105335-1-qperret@google.com>
 <20200131131508.GH102066@google.com>
 <20200131174055.GA8425@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200131174055.GA8425@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 31, 2020 at 05:40:55PM +0000, Quentin Perret wrote:
>On Friday 31 Jan 2020 at 13:15:08 (+0000), 'Matthias Maennich' via kernel-team wrote:
>> On Wed, Jan 29, 2020 at 06:15:41PM +0000, Quentin Perret wrote:
>> > diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
>> > index a904bf1f5e67..8e1b7f70e800 100755
>> > --- a/scripts/adjust_autoksyms.sh
>> > +++ b/scripts/adjust_autoksyms.sh
>> > @@ -48,6 +48,7 @@ cat > "$new_ksyms_file" << EOT
>> > EOT
>> > sed 's/ko$/mod/' modules.order |
>> > xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
>> > +cat - "${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}" |
>>
>> This handles absolute paths very well. I wonder whether we can make this
>> more useful for folks that want to maintain such a whitelist in their
>> copy of the tree. Lets say, I have in my sources
>> arch/x86/configs/x86_64_symbol_whitelist and in my config I have
>> CONFIG_UNUSED_KSYMS_WHITELIST="arch/x86/configs/x86_64_symbol_whitelist".
>>
>> If I see it correctly, UNUSED_KSYMS_WHITELIST is currently either an
>> absolute path or a relative path to the current build directory. I would
>> prefer if relative paths would be relative to the source directory to
>> support the above use case. (Note, that scenario above works if I build
>> directly in the sources, but fails if I build O=/somewhere/else.)
>
>Right, that is an interesting use case. I suppose something like the
>below should work (with appropriate documentation of the config option).
>
>---8<---
>diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
>index 8e1b7f70e800..d37803fd75ce 100755
>--- a/scripts/adjust_autoksyms.sh
>+++ b/scripts/adjust_autoksyms.sh
>@@ -38,6 +38,12 @@ esac
> # We need access to CONFIG_ symbols
> . include/config/auto.conf
>
>+ksym_wl="${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}"
>+# If the path is relative, it must be relative to the source tree
>+if [ "$ksym_wl" == "${ksym_wl#/}" ]; then
>+       ksym_wl="$abs_srctree/$ksym_wl"
>+fi
>+
> # Generate a new ksym list file with symbols needed by the current
> # set of modules.
> cat > "$new_ksyms_file" << EOT
>@@ -48,7 +54,7 @@ cat > "$new_ksyms_file" << EOT
> EOT
> sed 's/ko$/mod/' modules.order |
> xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
>-cat - "${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}" |
>+cat - "$ksym_wl" |
> sort -u |
> sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
>--->8---
>
>Thoughts ?

That definitely looks like I would expect that config option to work.
Thanks for looking into that!

Cheers,
Matthias

>
>Thanks,
>Quentin
