Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14877338406
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 03:51:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231768AbhCLCv1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 21:51:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231786AbhCLCvB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 21:51:01 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA81BC061574
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 18:51:00 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id nh23-20020a17090b3657b02900c0d5e235a8so10353370pjb.0
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 18:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jgKB3A92D5gwIxX7ZNPTWJNkyox2kFXe9uVkjxxztms=;
        b=Byp8VJLq4cTqNlyW1jcVtPh0g5LN5iNS4eR11K81JCbvgPvNMAhVXh9Gd+468WpnBc
         lejZk+bqLROi5s87MT9mO+QL80AzVMLefAwEp4YN4MFXFOgzdc//xji3nbCrTC8EviEH
         //3c1oVgTFeQhQtFuqphdUQ4neW/w26ZyRino=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jgKB3A92D5gwIxX7ZNPTWJNkyox2kFXe9uVkjxxztms=;
        b=I6GROHUneS7K8DH8S48u+Gm6Bw2E2UQZWPenD78WGE4DkAWlaNvf1U4b/EzEw8sVFv
         358gxaWNy88HRmZIbe8b4nyncQZBVhhneoUNZKq2Hr5rgLVudc8qDOkHLhy2fvdJSB9Y
         RfuDarZj2lmU4vQY3DS5KVehdNmSM4ej3X4SMa7R+CCu8QWJt/+p3DgytYeY0pbeoJ85
         vJOcJTFB40/cVMFYP+FA5kdeLQ2Pi2AMUr39ek6jUcO8fx/H2IlIIz8PIRF8crGX58S2
         XEzO+CtKvIZ+XJNGSz3XYH7P98nyWI1G0WwwwlEbM+pbPQVDAp7k919oPjdeobXgN//n
         UuWA==
X-Gm-Message-State: AOAM533vZ1/fPd+J4NpbHMBXVTpDj545TpxUtDo2fvfklPhO5yoyble0
        raShMIv/txfh+YbeAbGlunYoHg==
X-Google-Smtp-Source: ABdhPJwAHxl/NS7FlgAJRz5QaAvQOXkfhkHGZcnAZkR6rCdXdtzDyILaDAk8TTtJWufQKkWHZbPLwA==
X-Received: by 2002:a17:903:4093:b029:e5:b933:fab7 with SMTP id z19-20020a1709034093b02900e5b933fab7mr11028894plc.11.1615517460606;
        Thu, 11 Mar 2021 18:51:00 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w188sm3656858pfw.177.2021.03.11.18.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 18:50:59 -0800 (PST)
Date:   Thu, 11 Mar 2021 18:50:59 -0800
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
Subject: Re: [PATCH 16/17] KVM: arm64: Disable CFI for nVHE
Message-ID: <202103111850.163D807@keescook>
References: <20210312004919.669614-1-samitolvanen@google.com>
 <20210312004919.669614-17-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312004919.669614-17-samitolvanen@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 11, 2021 at 04:49:18PM -0800, Sami Tolvanen wrote:
> Disable CFI for the nVHE code to avoid address space confusion.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
