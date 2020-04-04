Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71A1119E29B
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Apr 2020 06:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgDDECo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Apr 2020 00:02:44 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34652 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgDDECo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Apr 2020 00:02:44 -0400
Received: by mail-oi1-f193.google.com with SMTP id d3so8149632oic.1;
        Fri, 03 Apr 2020 21:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HGQtBy/Y1NLvvkMjbES/Jv6f17twJdxb+OF5qTeiXgQ=;
        b=BIAUI0LBOaQDGKRe47/4i+hAgK3nJrfqyXHRiKf7Kdy82NHFpdIqy5Q6mdiPbEL9Rk
         FMjiw8VSi0r151xr25Y45fHsuWG6Bf9BzOSPU+TrRtKP9m2pcOZ/Z6T9XgIx7U6Nv/LK
         Fu/4TQUQxZOi3PqCjYHu8tgeLSFfLz9iwTvyaExLwY+I2J40kN5zoEmzGN7CbuWACbRF
         DameoPYfbrTT3ypa95xXmSA/KLPbDnLNAjOiOF87ZlEOSYl3t2aLEC0YN8QU+GlnoROZ
         hJrxStMcGA0053Nt22EhgFlXly8JB6Q83SMJGbA4s327TFoudZklfH3Z0wnaeENqx6Tc
         FnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HGQtBy/Y1NLvvkMjbES/Jv6f17twJdxb+OF5qTeiXgQ=;
        b=p3hwU1lIx8Rsopi/twFsXize/9UsrAY/D44yUQ2h5jbvw3KzoEXL1X3ImqU/FrNwPH
         ppc6dZNFY2q91mx3ThDnzWCV3MrUNdVQRcecXSkQ8yht3dAKqSXxkZ/F8Tesu+/xFbg7
         F/ukomYG0xAfEztJyAZHZSg57+Pi8w+9rSjkdE+1vGk9KTPdLU6wkdfTND0FAUs7SrJ2
         K3W0V7vWxjPuMcA2zF9n9Jfxy+b7h1jKk4LfEyCJBSiCBgoEl+D53JU14vHXPnt4lhn9
         o3vkrsh5Z1tXdV+lvXkHGRZLoLTQ91919IGbaQLV+NF2QXIbbhCP4cuL/Rn7VOBqVT31
         E6jA==
X-Gm-Message-State: AGi0PuYS8SMqBqYnaWtGyqLRl5xnRYMhka89T/vmQZqefdGzJoHkiO5v
        jxO+YU4d1ucdG6w5k7mfjlw=
X-Google-Smtp-Source: APiQypIh23+8/UlthZbcuHVsMA3NTNp5LFyre/YiWhPzNGi9vX7BiDG7fzPVg3WPvserQAFcfYyEhg==
X-Received: by 2002:aca:5c44:: with SMTP id q65mr5623823oib.139.1585972963355;
        Fri, 03 Apr 2020 21:02:43 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id t3sm2719866oth.0.2020.04.03.21.02.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Apr 2020 21:02:42 -0700 (PDT)
Date:   Fri, 3 Apr 2020 21:02:41 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: mkcompile_h: Include $LD version in /proc/version
Message-ID: <20200404040241.GA41628@ubuntu-m2-xlarge-x86>
References: <202004020117.6E434C035@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202004020117.6E434C035@keescook>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 02, 2020 at 01:18:37AM -0700, Kees Cook wrote:
> When doing Clang builds of the kernel, it is possible to link with
> either ld.bfd (binutils) or ld.lld (LLVM), but it is not possible to
> discover this from a running kernel. Add the "$LD -v" output to
> /proc/version.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>

With this patch + Masahiro's fold in:

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>
