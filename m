Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3074343538D
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 21:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231485AbhJTTPD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 15:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231433AbhJTTPC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 15:15:02 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC1AC061749
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Oct 2021 12:12:48 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id s136so20150160pgs.4
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Oct 2021 12:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CFUDLBWdmnPV44bi7dVx5A56FXXnHIGNsm6BfJl0RsI=;
        b=JtQFBqmyuqUGLOJirZEnfOGRzSjyJfk76syhW8olBgTsaSJ1WrRnDKlU8xrvFkJEbB
         YZO0dY/VKA9+YDBXn7kwblGNLtajGRhaUcQJVIjGCA+DbxnLTaesnzOROD4lAa6oBXO3
         ABy/6N42oUMuboWXbEo0EIYQPT+5a/NVcybC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CFUDLBWdmnPV44bi7dVx5A56FXXnHIGNsm6BfJl0RsI=;
        b=gupALI/rkm9OOcyraMEAQvH5791tdomPmNX9QIfytWIJnDYK/byep807oPPBjPORrc
         MYSh7mpatGnXYeVVF/6EoRKDtegt2m42+eNNifYYm4zSjutSkUI2qtlaAJM4WkI0w/0L
         hTP7921xGWe56/gKMYH4NpMfwtu8Pj4+pv1j6ron0K8LInS1PgGTqZ/+dA7tQKOKknjj
         sk6oUSrN6JEV01cglvG5kNPHj4E9hR3P64SFSBAyzPlxrYfGIa+koGbGMvkhYsEgHGfN
         W2FpLrGZiWk2ZGSvi/jUc5TUtw1pnGl6hqdYKk+k/HFri9wM7DU0sNCrlFoaWHCBKrDf
         otOg==
X-Gm-Message-State: AOAM533q+tcJ91qWZVUiEyAGgqesbFXHVOqZgD3NF8XjyziKJ6/LmUNY
        1gYcO4BPDrlKcpH58mz04HCIlg==
X-Google-Smtp-Source: ABdhPJzl2+SAfUh6NkJ+DhCKOWmzKsU6GNvGxGf2XT0aJXU9P6UbVjWdBAkeh+PuF3DGKEHMZ/Xdaw==
X-Received: by 2002:a63:4622:: with SMTP id t34mr814413pga.293.1634757167736;
        Wed, 20 Oct 2021 12:12:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e9sm3758333pfv.189.2021.10.20.12.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 12:12:47 -0700 (PDT)
Date:   Wed, 20 Oct 2021 12:12:46 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        llvm@lists.linux.dev, Dan Li <ashimida@linux.alibaba.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] gcc-plugins: Explicitly document purpose and
 deprecation schedule
Message-ID: <202110201212.C155FE92@keescook>
References: <20211020173554.38122-1-keescook@chromium.org>
 <20211020173554.38122-2-keescook@chromium.org>
 <CANiq72kCQa7_3JkUqO2=mdj+P2zcjPYJUai0oip5DN7Aaq_ySQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72kCQa7_3JkUqO2=mdj+P2zcjPYJUai0oip5DN7Aaq_ySQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 20, 2021 at 07:44:19PM +0200, Miguel Ojeda wrote:
> On Wed, Oct 20, 2021 at 7:35 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > +Purpose
> > +=======
> 
> Sounds good to me.
> 
> >  config GCC_PLUGIN_SANCOV
> >         bool
> > +       # Plugin can be removed once the kernel only supports GCC 6.1.0+
> 
> Since we are just giving the major in the other cases below, I would
> just say GCC 6+ here (the numbering scheme changed in GCC 5 already).

Sure; now updated.

> Thanks for adding the versions, by the way -- this is useful long-term
> and not always done for other things...

Yeah, I always struggled to find when options were added to GCC, so I
wanted this for my poor brain too. :)

> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

-- 
Kees Cook
