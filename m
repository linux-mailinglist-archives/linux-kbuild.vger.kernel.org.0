Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 274F1435385
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 21:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231522AbhJTTNp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 15:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231521AbhJTTNp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 15:13:45 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFCA4C061755
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Oct 2021 12:11:30 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id pi19-20020a17090b1e5300b0019fdd3557d3so3112994pjb.5
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Oct 2021 12:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VT1ZnTWZw0jMkeN3fDOrnC1r/jUp1V3OZwD2nwImWMk=;
        b=nre93T6MzHelf00EfakHYDHtu00QJEKItoSAkKHGP3gUTjHdigzheidpN0Cn+ghvKd
         LKWv2/OIotRWfXs/WCG7an5/vs5KygZtizL39PVLhD9YZOfqaFwrzigVA2RIjTye4bHE
         OWKNrjwp2iiSwr71nYKpU9JH0SPNhhNIbBfEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VT1ZnTWZw0jMkeN3fDOrnC1r/jUp1V3OZwD2nwImWMk=;
        b=B9VuNOuMJQ0Gz4CU0c3Sp8Hw4hRVRwow9KFUiRNYLFgI+q+kU29NiBdjpZ5sZ5bDkN
         NtHDbJsHqSpx52B9n+tWh9f7j41yZBLWyd+Mx6VRMCBJchJ5oF+Ja1R1+wYPTYFqHzZP
         AC04qgSEoXX9BExMBOYhe6mJn8aN7Zd51gTEvi2kpfXxF2kLFJGCkINcf6CLibEs/i45
         +7c7XVyy8OSMUcFVE8nksHn7ey2o6iUJBLOLJQdR9PJKMqRtLjiSrQB1tOi80v5sLxxY
         zzni7yk85YSEVPFhf/K7jpgR89KPdrWPaEj/j5ip3JUVn18i85XZdFAp3dMxTjvYXZRW
         ag+g==
X-Gm-Message-State: AOAM532PNznsi1eJdA9ix5bZ5O4BTWnwrBbHhW3Ao4qvMfkF32nBBheQ
        T1sXLPnTHzwTUCdQ47UbYNyZ2g==
X-Google-Smtp-Source: ABdhPJyVMN7MoPGQBIowKQmEG8vN3pK31aaAQUVHuBVZpxjnw8chkJkUkW744OD0Z5Ryu083zYUf6Q==
X-Received: by 2002:a17:90a:e54d:: with SMTP id ei13mr950751pjb.65.1634757090342;
        Wed, 20 Oct 2021 12:11:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x13sm2869108pge.37.2021.10.20.12.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 12:11:29 -0700 (PDT)
Date:   Wed, 20 Oct 2021 12:11:29 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Emese Revfy <re.emese@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Dan Li <ashimida@linux.alibaba.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] gcc-plugins: Remove cyc_complexity
Message-ID: <202110201210.1F70546@keescook>
References: <20211020173554.38122-1-keescook@chromium.org>
 <20211020173554.38122-3-keescook@chromium.org>
 <CANiq72kveT40jX8GWjs1dy0o3YjowUGtGTddPb+da114sb+4iA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72kveT40jX8GWjs1dy0o3YjowUGtGTddPb+da114sb+4iA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 20, 2021 at 07:48:55PM +0200, Miguel Ojeda wrote:
> On Wed, Oct 20, 2021 at 7:35 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > - * Copyright 2011-2016 by Emese Revfy <re.emese@gmail.com>
> 
> Perhaps we should Cc this address to give them notice.

Good point; I'm in the habit of that happening automatically as Emese
was a co-maintainer of the gcc-plugins. Sorry for the oversight here.

> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

-- 
Kees Cook
