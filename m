Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0007425CDFC
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Sep 2020 00:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728678AbgICWpN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Sep 2020 18:45:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729356AbgICWpH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Sep 2020 18:45:07 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 681D1C061246
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Sep 2020 15:45:06 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id v196so3514983pfc.1
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Sep 2020 15:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eNUX/+cTGqvgJ3/bHzJkiLjPir7L2OtlnI7Fkl+Xb2A=;
        b=EnTAgexJsxXcgEbYIyXAxzgDAfpWUMxvmgoddQQgsTw/gu1PMimkQi0sFP+vzoRcoR
         R5cz17bX6mXjaaXhIIENszOU7GVzd7UtV6ivYdntcxzorGKNslOUw1wAcWUJDwdLZcXs
         t89r3dF6Bm22f/kj6qlw0hvfFybNvnGy7LAoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eNUX/+cTGqvgJ3/bHzJkiLjPir7L2OtlnI7Fkl+Xb2A=;
        b=pFXmb7g9xycLJmKqgEix7VZoEnUrQdamQ+i/tckGVBm/Xr/pVxAZAJk9n6983qSX8L
         H+cn+nirHWns9LUOm2U64ZeJ60lCO1BimBVNJtcly3mSQi/F95IB0Scumxn/mcqU7RfZ
         S8kqKqOY9bTAvAmrcMpt1bMpTIsb2ec/5D86IrfKg9Govm2gtWk4hV9ztsJ+9fkjHhmu
         qURINEbB4SSC7PwEh7MSBpKug/mgyOeTsaMcZ0lqzFytZ6QhB4f4Awerj+MONcsxzaCD
         F/n3kP7G9QMr6oSWKFTIkfAopDXhHqdGzC84wZAZfVpkFrNrUVLtimt6L/COWmi6Tesg
         zGeQ==
X-Gm-Message-State: AOAM531ifeSnhvtBZ+3J9k2ROSnC9F+2gRrk0R4/Y15KbRLwCpU3Uosz
        pZuhPlts15bhdLI47g6ybrkgjQ==
X-Google-Smtp-Source: ABdhPJyNZusftJcT3VvVFgkaB8aDPyaKtOWJ1b5YXcXD0oRJUTHNPVuoSuBrwlfSbjV/D5xOI4z0Ow==
X-Received: by 2002:a17:902:7045:: with SMTP id h5mr6014077plt.4.1599173106022;
        Thu, 03 Sep 2020 15:45:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id bv7sm1885610pjb.55.2020.09.03.15.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 15:45:05 -0700 (PDT)
Date:   Thu, 3 Sep 2020 15:45:04 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        x86@kernel.org
Subject: Re: [PATCH v2 23/28] arm64: vdso: disable LTO
Message-ID: <202009031544.61133BF@keescook>
References: <20200624203200.78870-1-samitolvanen@google.com>
 <20200903203053.3411268-1-samitolvanen@google.com>
 <20200903203053.3411268-24-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903203053.3411268-24-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 03, 2020 at 01:30:48PM -0700, Sami Tolvanen wrote:
> Disable LTO for the vDSO by filtering out CC_FLAGS_LTO, as there's no
> point in using link-time optimization for the small about of C code.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Yup. (And another replacement of the non-functional DISABLE_LTO...)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
