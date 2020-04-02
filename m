Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5A5019C842
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2020 19:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389511AbgDBRmz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Apr 2020 13:42:55 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37042 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389264AbgDBRmz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 13:42:55 -0400
Received: by mail-ot1-f68.google.com with SMTP id g23so4350181otq.4;
        Thu, 02 Apr 2020 10:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AM4asBwnLyBdo8YxbWkR1sjxTEK7w5QaIa+bEyGHEF0=;
        b=MlAh8ZM29LF90S2zcrhijXtgJLYbw7Ir/pEHmbf8ESKR8q4xlyOo1VgSMsY3vjCbjP
         I8nCjEgqsuC4S5B9j34DJesXpU56AB7ZAF/t6xAsgSMm0oYMEyOUKdk6C/NuJQJmAKxk
         iXIJ9PkNU8q22b8gy2uE5S0WfoXdyrafuNRfyW6fSrExDVGEoKJ4B8418gn9m+6qQR0R
         XdufofDVDIb0GBTq/6n3Igh8MBvLXXJ3JXjZ8lJawZnwpkUkPGSkiymCNoeghjE674/8
         fiAL1z/zRiRGiU+5ObnPKpihKZ6EmRs8bnacizEZL9TcPzYUzzlRuKML1iHuSaMRKo8P
         zsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AM4asBwnLyBdo8YxbWkR1sjxTEK7w5QaIa+bEyGHEF0=;
        b=Egqq0lti4LFLUkJoDj+xI2ozLw+kXZ3DLZV+Fg21VB2vWUVrpMJ9yIFMyMYQQz+Xxs
         6Dq175CvBBqFuC1dvL7dadiehKz2ngdGHo9Ho+Rr6ACWq81dNl3qq3ZYgLzV8IHsHQIa
         PSm9IWikxa9PfnPk0eXUdODuUAs37iwylnF8a64QKfrGwNPkdu4OBD8dEBRPs4oQLY5j
         eiSl4ByJgz4XPCBmk5iBw+Ui7prI2nNBWqGtm6bi70MdAJanMWa6vBRuRUK8uiuIThWn
         4ysaZbET6TWzL2KFpa97IksaPo4teu9+ez7PahcO6cLgoHFRyZTrm2+t75Hfi5miOAUd
         ndeg==
X-Gm-Message-State: AGi0PuZ/6aWs+9Z0OBIOi5wDk4+cu5tI6nS7mQWPcG2DTeo/0aVSRbPd
        ege9Z4NIE8qLq6EpJKYRDuc=
X-Google-Smtp-Source: APiQypL0G7qtJatfkm3zFmTfdY40b5htA/BYVHuSk6t2vZlEBWANr89SzjyjA4oSLWcMkQT0nEpnlw==
X-Received: by 2002:a9d:7c94:: with SMTP id q20mr2929597otn.150.1585849373038;
        Thu, 02 Apr 2020 10:42:53 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id k24sm1505151oik.24.2020.04.02.10.42.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Apr 2020 10:42:52 -0700 (PDT)
Date:   Thu, 2 Apr 2020 10:42:50 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Fangrui Song <maskray@google.com>
Cc:     corbet@lwn.net, masahiroy@kernel.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH] Documentation/llvm: fix the name of llvm-size
Message-ID: <20200402174250.GA33476@ubuntu-m2-xlarge-x86>
References: <20200402173842.96013-1-maskray@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402173842.96013-1-maskray@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 02, 2020 at 10:38:42AM -0700, 'Fangrui Song' via Clang Built Linux wrote:
> The tool is called llvm-size, not llvm-objsize.
> 
> Fixes: fcf1b6a35c16 ("Documentation/llvm: add documentation on building w/ Clang/LLVM")
> Signed-off-by: Fangrui Song <maskray@google.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
>  Documentation/kbuild/llvm.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index d6c79eb4e23e..eefbdfa3e4d9 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -51,7 +51,7 @@ LLVM has substitutes for GNU binutils utilities. These can be invoked as
>  additional parameters to `make`.
>  
>  	make CC=clang AS=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \\
> -	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-objsize \\
> +	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-size \\
>  	  READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \\
>  	  HOSTLD=ld.lld
>  
> -- 
> 2.26.0.rc2.310.g2932bb562d-goog
> 
