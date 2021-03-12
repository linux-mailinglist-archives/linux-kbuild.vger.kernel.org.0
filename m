Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E45253383CE
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 03:46:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbhCLCpd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 21:45:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231562AbhCLCpT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 21:45:19 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 432B9C061764
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 18:45:19 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id t85so842071pfc.13
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 18:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AssdNLgVnE+ciH4+zO5lxL3YhHsnzigu9rKdFnlTKlk=;
        b=hIQlmeCWP7pIGfJ5QNK11xJD01Ah5yhUwvyA2ww7yhNm+fTC+X7nXsvxCf/cfPJkw8
         nkcI9fivFzWEt/maVUeYndiFDn25FO8B7W04AYR/UDOt3gRYjRZzQNUCnbTnncwE0cZP
         XqXc4TvxtdB2n7+7RQIxaEFd3VdXAy+vdwy6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AssdNLgVnE+ciH4+zO5lxL3YhHsnzigu9rKdFnlTKlk=;
        b=TKtt4atQGJFE4yzVHwfMu8Pq+iiMLZNv0nWZMgxHqu3rtiQcPnyG+jXXtXa8cnopi8
         VmJBLl2MGvGE99rbZd887p+4tInjES4q9Zbe7JumB9BuZkGmDl9jknjI7eju+DELvI/b
         ElqVpccbvk3Zy9PoZQak5hbEK/fcRroHFoG5ZgtHEj8J0UD7iSoKHxcAEzmh/hzkfBGm
         dhJNJFQx9bfM7TCMPKs0yU7qwXZxq7v6XCoVLGp+ig6Jo0nPxhD4byZZKNxPO6DwZ76T
         sj+oR+CiJrn2zJRzubAxBPKHEzNJSpeLdCGmKjGVCoLNnw+d6v+HxwY3kzXNaWhUDIA4
         cJmQ==
X-Gm-Message-State: AOAM533NSIIR5atIW8WJlMWd2p6KF3DS0l65q6TJI+HRXYRrHIW7SFsZ
        9tfhFHaLeGY58yzkeLWP5YNjdw==
X-Google-Smtp-Source: ABdhPJxI0qWCdvIWD0Iv1exumtIeT9fGoJnsI5bP8+qNI3aaTbYLPtnoi/Tg5jl4840YLUIassNTiw==
X-Received: by 2002:a63:1e0a:: with SMTP id e10mr9855197pge.3.1615517118872;
        Thu, 11 Mar 2021 18:45:18 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 14sm3673048pfo.141.2021.03.11.18.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 18:45:18 -0800 (PST)
Date:   Thu, 11 Mar 2021 18:45:17 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>,
        bpf@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kbuild@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/17] bpf: disable CFI in dispatcher functions
Message-ID: <202103111845.3A6EEB3E43@keescook>
References: <20210312004919.669614-1-samitolvanen@google.com>
 <20210312004919.669614-9-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312004919.669614-9-samitolvanen@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 11, 2021 at 04:49:10PM -0800, Sami Tolvanen wrote:
> BPF dispatcher functions are patched at runtime to perform direct
> instead of indirect calls. Disable CFI for the dispatcher functions to
> avoid conflicts.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
