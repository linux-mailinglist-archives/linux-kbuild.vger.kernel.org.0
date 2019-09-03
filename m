Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8399CA60BB
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Sep 2019 07:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbfICFhk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Sep 2019 01:37:40 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38524 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbfICFhk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Sep 2019 01:37:40 -0400
Received: by mail-wm1-f67.google.com with SMTP id o184so16567691wme.3;
        Mon, 02 Sep 2019 22:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dHZB7av9ACZZKXwGXky8ptXmiuaPwp7UFQYgxLaFadk=;
        b=ZHTJjC9mcxUyZllM3u90Dq/A9Yw5Ml0cRRfAWmttvW3PhUNPkzfuRj+UJHiRIKyB/u
         pAJ2ZeFHTPoZNBEr4Y+DqpB/My5LeV69caKE2dozG5WuweRwPxubEDLwjKtnXZa2OzDP
         o7EbjQxqtpZYs9NyIgRxzFBO0XK4rwzZLF5ZNwEwmLUVrh7Fj/X+fCgCEOd79v/ur7ht
         W/1XrenehgzYcmw5h14CuA9YIeF1vaw4GVKXihhVjcECQSn4eMyRRFeLD3ERW+0NJhll
         b6D3L+sYxr2DIPo2nw7cg95QyReGQcfJMA9a5bvNzTGkK6kgsix6BjJIPgot68XIfCon
         z2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dHZB7av9ACZZKXwGXky8ptXmiuaPwp7UFQYgxLaFadk=;
        b=DouWJIz5GZiUBOa8nLIueVHyvw6mKeBHS4+X6YYnpEcy+bqI7IS6TfKC24tIILUc3X
         4ZrSMRYN5uUUn3aZJftcPfcSPoM6sfwaKFYYVNWJUGpFhX2tQMROW3zR9tSJhC58v554
         cUVkLUfpWfwZrpTg4U+9bW0sTUH6GZMfjKzqqmUgK+O9m79fef/Rb9KDrWT1tQrV6SAu
         EouY6GR+oQ8F0cMASt1lTMj0i48FnCtbTvfbjdaOWbQjwz2dONLHvSMCSQenVfO5RvCm
         GhNpB4/eaqtA7AClfftOFmJQZuMNuBZx6lWXSAQO1J8JNzC05qv/wseIlh8jwtB6hkkr
         b9aA==
X-Gm-Message-State: APjAAAXSfhoJaHDMWTKsWcPC99s2E3iHHsQTyVC3u4U8TuBP2OJ/S/82
        6GeMSyNt+XQ3ed/STXWxAlw=
X-Google-Smtp-Source: APXvYqy4lgkFGkl7Qf9buQYgHWfd2Vr+qRY5+MNXkk3jPv4O/wnCd+JJv5RYYpR6k0I+LpcLG5gKBQ==
X-Received: by 2002:a7b:cf0a:: with SMTP id l10mr8284178wmg.4.1567489057760;
        Mon, 02 Sep 2019 22:37:37 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id f24sm16833876wmc.25.2019.09.02.22.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 22:37:37 -0700 (PDT)
Date:   Mon, 2 Sep 2019 22:37:35 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] kbuild: rename KBUILD_ENABLE_EXTRA_GCC_CHECKS to
 KBUILD_EXTRA_WARN
Message-ID: <20190903053735.GA56603@archlinux-threadripper>
References: <20190831162555.31887-1-yamada.masahiro@socionext.com>
 <20190831162555.31887-2-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190831162555.31887-2-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Sep 01, 2019 at 01:25:55AM +0900, Masahiro Yamada wrote:
> KBUILD_ENABLE_EXTRA_GCC_CHECKS started as a switch to add extra warning
> options for GCC, but now it is a historical misnomer since we use it
> also for Clang, DTC, and even kernel-doc.
> 
> Rename it to more sensible, and shorter KBUILD_EXTRA_WARN.
> 
> For the backward compatibility, KBUILD_ENABLE_EXTRA_GCC_CHECKS is still
> supported (but not advertised in the documentation).
> 
> I also fixed up 'make help', and updated the documentation.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
