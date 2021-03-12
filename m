Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D55B03383E2
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 03:47:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231467AbhCLCqi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 21:46:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231788AbhCLCqW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 21:46:22 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF89C061574
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 18:46:22 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id x7-20020a17090a2b07b02900c0ea793940so10057420pjc.2
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 18:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3x8wPNWDF/9lMYXSZwL36CZQWnEVZfdICW0j1WUI2Xc=;
        b=Cl5fNZZq/SgrZczxCy+a2QRKYJuXT+6kXJ+VmO2lDHQ7ubzS7ZwXipGTDBJ4dO8rK/
         IeOOI9GOEttF1QSmu0XAOk0Gloj2MZ0Ib6Qz9r+zuLKSHXUz3Xu43XFBqEkBvEB1loN3
         RRkip/PZ0afw6skqKgq8ZCRwgY8XWK2/a3rkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3x8wPNWDF/9lMYXSZwL36CZQWnEVZfdICW0j1WUI2Xc=;
        b=VPrdYZpIFrH2EFNJj3HmkgO7NQL99/DJN1Sp534YM6kE0nbk8XAf7swsac9R6Lgc5V
         8GN6dAYO9a6LUyZH54m3KFcxYXr3yJpDTWK/ezbzq8saa2jYpMlsZjUM6DvElMm+TQia
         0PaSEexnNHgLebzSnQ3kdxcV7Gl5BZkWN6+U5qzqlAQonzt1b5XGkd9vrb3S0gxC1D7F
         FmUN42FOl7aiVR6oNZa64bvV5vmfkvV3lLy1G9VQasnrYhIEJm6eIDZ/cbJaoIEBtX75
         jtmiAVNy3ZLKM+MEqxzh5iDXmVd65jcqz0NiaJRWq0NwVSGpYIOmjxSBnu3MUM4qDmS8
         8BVg==
X-Gm-Message-State: AOAM5315NzW3aAsep9P31MlP/YPwE3CEoc1ZrkAOTnBYG9K5IY0zFkPh
        cvT6z494o8npPHR2C7pGG9WbIw==
X-Google-Smtp-Source: ABdhPJwfiqpEB0ZCSX1blMYrqv2l+v2mx712W/a/L5gcEq6rFAAUBWmeBThCqeCPc6yu/0eVJaAdiQ==
X-Received: by 2002:a17:902:e8c4:b029:e2:b7d3:4fd7 with SMTP id v4-20020a170902e8c4b02900e2b7d34fd7mr10797062plg.73.1615517182025;
        Thu, 11 Mar 2021 18:46:22 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id ms21sm409762pjb.5.2021.03.11.18.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 18:46:21 -0800 (PST)
Date:   Thu, 11 Mar 2021 18:46:20 -0800
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
Subject: Re: [PATCH 12/17] arm64: implement __va_function
Message-ID: <202103111846.A6B653A434@keescook>
References: <20210312004919.669614-1-samitolvanen@google.com>
 <20210312004919.669614-13-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312004919.669614-13-samitolvanen@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 11, 2021 at 04:49:14PM -0800, Sami Tolvanen wrote:
> With CONFIG_CFI_CLANG, the compiler replaces function addresses in
> instrumented C code with jump table addresses. This change implements
> the __va_function() macro, which returns the actual function address
> instead.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
