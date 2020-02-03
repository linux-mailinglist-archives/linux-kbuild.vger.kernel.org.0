Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 931B91510C2
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Feb 2020 21:07:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbgBCUHB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Feb 2020 15:07:01 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:37577 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbgBCUHB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Feb 2020 15:07:01 -0500
Received: by mail-qk1-f196.google.com with SMTP id 21so15560449qky.4;
        Mon, 03 Feb 2020 12:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IclPfbWxjSC/TSpa0Kut2cFNovoBC/Wcgdo4i3pqqss=;
        b=KKiG74HZ/dv3ljH3tB34cOrZR8LkxaDIS1+4WgcXYDqlezNUTbQqO+e1mL6jF8eUKr
         BC0hhKUOiHnpSVjj17QzxvJvQIcAWLhFENLpCbUlW6Ruq0MexbTJMGh4kZEzZJBwA/3j
         H3DgSrrnp6YzPlJ7OHIjmE7RcmarP7lQWVecUizw+QUiLoSM+XpcZXgbAnQxEXEPJ9Cx
         Az+oCpmHqGXS9Xov5U7hIrs2g/nyPCOHPwYpiMiFq7+qU0OS2W5M/eivUHH6JPO9Sdh7
         vtVBc2za1No6qIY9+YoqWJuNQejuzvuEpz58uIrVRR1ltyqxpbgxKbiIGLleXynC+3OS
         Hr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=IclPfbWxjSC/TSpa0Kut2cFNovoBC/Wcgdo4i3pqqss=;
        b=lIDnPwhBDCOTRCvFRwtlV/bWEoktzR6Nos66/gWredjEAWKwNUyU3sXg8UKjBfj97v
         IFLRGmNuplZh7siuTuuK9DU76CCbpsQhB5eZkOxcKDioa8msiGyOuK5K5eC2rqxres5y
         xnJxOZ3M7iesCkLqwFayWfZ6AEzkm1V8I4G6Om+CXsZavUReOUCMDu+bzbeKn1VTub3X
         SgLZjILgQXhWb4ZPbmQ2RoBChU3AZPVX3IFh8qF3Co2PR7xceT9jXsx+Nr2+Rxg6FkhX
         psU+UTsqUMP8d5wlfYSxMvtGN0ZKJVPb/QHr3FRzadHJqlNgXOZ+B5ODTVOEDPgBjOgQ
         M1qg==
X-Gm-Message-State: APjAAAW5xwPa6x6OySifsWL3QAWiNEudITE1ky616WjGpZ6/+uznB/yG
        sum49+JKsDR/pSAjkCgVAzjjy9uC
X-Google-Smtp-Source: APXvYqylQdHsMewq1VKDxEo9OJFlXtA4NPbNYX8Xq2nlC6OJd12zr+Khg/YKCNet+pyeSfkSRfX2nA==
X-Received: by 2002:a37:4dc1:: with SMTP id a184mr25783838qkb.62.1580760420403;
        Mon, 03 Feb 2020 12:07:00 -0800 (PST)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id o17sm10356297qtq.93.2020.02.03.12.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 12:07:00 -0800 (PST)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Mon, 3 Feb 2020 15:06:58 -0500
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Thelen <gthelen@google.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] initramfs: do not show compression mode choice if
 INITRAMFS_SOURCE is empty
Message-ID: <20200203200656.GA455151@rani.riverdale.lan>
References: <20200203164708.17478-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200203164708.17478-1-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 04, 2020 at 01:47:08AM +0900, Masahiro Yamada wrote:
> Since commit ddd09bcc899f ("initramfs: make compression options not
> depend on INITRAMFS_SOURCE"), Kconfig asks the compression mode for
> the built-in initramfs regardless of INITRAMFS_SOURCE.
> 
> It is technically simpler, but pointless from a UI perspective,
> Linus says [1].
> 
> When INITRAMFS_SOURCE is empty, usr/Makefile creates a tiny default
> cpio, which is so small that nobody cares about the compression.
> 
> This commit hides the Kconfig choice in that case. The default cpio
> is embedded without compression, which was the original behavior.
> 
> [1]: https://lkml.org/lkml/2020/2/1/160
> 
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Would it be feasible to check if the kernel is going to be compressed,
i.e. one of the KERNEL_{GZIP,BZIP2,...} options other than
KERNEL_UNCOMPRESSED is set, and default built-in initramfs to
uncompressed in that case as well?

Thanks.
