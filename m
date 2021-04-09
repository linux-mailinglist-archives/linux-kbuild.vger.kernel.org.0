Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F84D359299
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Apr 2021 05:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233287AbhDIDJx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Apr 2021 23:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233290AbhDIDJm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Apr 2021 23:09:42 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CA7EC061765
        for <linux-kbuild@vger.kernel.org>; Thu,  8 Apr 2021 20:09:30 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id i190so3267586pfc.12
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Apr 2021 20:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pzLF/lHRMx9vgkoBZHdk4xI+EiBYL1/uNXhLwkRFSmM=;
        b=OeE7IznlXSfWWKdviytwQM4KbR437rKzj4xvPdc79uyd8F6aLYSHLkWOqPXFjy4EB2
         MLVDrO4ox7QQmpuK7akGQCenaMTw+6qzkwzzH3MzzPZlkTMvC+rlWdCbkkyj2Tm2iYE5
         qTfb8MSjfgJpWsFlIBS2I9A8P0/njmb4fctms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pzLF/lHRMx9vgkoBZHdk4xI+EiBYL1/uNXhLwkRFSmM=;
        b=Fq85KCNuJjyVnX98N3ypkhAXZzGOTvO6f4T4XWQcGvuY4bsYpPmEMR8R+kjLIPD2IW
         H9TFTPxMde0KyQtlhj7IAgJK/PO0nr/Ib/2DCZRBYbpZTuHXvWNrYca+k9RwNWDsE9Md
         rW8SYuH/QwVGXvP1+uUy2nypmW0YGVUOzwIph3A2xEcgsa76i/gStoFh15+p6hDd/noG
         RY54P2+hgHzZnfZlQXy4MXnAKfW5zy7hMoamqIYXOgCExFcflOgEM/4UWqcRTpl+A2sy
         UOmjpwY6/+qcLb4w5CTLs6tw2dLTTEESOlolUntKRv8tvYPCI+rWZaJa1ExIgyt0K7sx
         68fw==
X-Gm-Message-State: AOAM532I/yLKHGdXSApzuKWfDUqjVSyzi+wKKLigeUUo2JoD87gVkAMu
        iagB23llT1lMPLgt40PQXC8T9A==
X-Google-Smtp-Source: ABdhPJwwy6+mv9pUNr/1qqHuXXu1m6bi5wMnUF5/No1rulmymNz/L6yikGAtpzQlqI7ckzUJ+zOkHw==
X-Received: by 2002:a65:6415:: with SMTP id a21mr10976731pgv.417.1617937769921;
        Thu, 08 Apr 2021 20:09:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h16sm667691pfc.194.2021.04.08.20.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 20:09:29 -0700 (PDT)
Date:   Thu, 8 Apr 2021 20:09:28 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH 08/20] kbuild: riscv: use common install script
Message-ID: <202104082009.389521C4ED@keescook>
References: <20210407053419.449796-1-gregkh@linuxfoundation.org>
 <20210407053419.449796-9-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407053419.449796-9-gregkh@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 07, 2021 at 07:34:07AM +0200, Greg Kroah-Hartman wrote:
> The common scripts/install.sh script will now work for riscv, all that
> is needed is to add the compressed image type to it.  So add that file
> type check and remove the riscv-only version of the file.
> 
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
