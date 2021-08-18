Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47EAF3F0E3E
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 00:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234788AbhHRWhK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 18:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234693AbhHRWhJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 18:37:09 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFDB7C061764
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 15:36:34 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id y11so3651320pfl.13
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 15:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2sMII5G/YrPb+0dkZspyZPS9+RZRKOtmg2+pJ+lOQh8=;
        b=zCeTW3J0K5np3tXoG1IVSEAaPhRTsp6E7FG40JMxEKemO8ZOHARazqIQmpKFIcs6Sd
         N+GcdWyWkTcutczTnN4sOyyVCxvFWCYptMFPsGfhg09eZke8WGMWE7X323gqAUdPsHGt
         GJI+Q1n5sJHSiu6jvMoqplSND0vhS0iaBcT4D21x/nhiQ6MHkY+ruWt2EXdQpfM96zjC
         hi5+qOD40TDeOvrQRR206d0ujvibZUy7wKb/uB+gerRXWqa6ZBPhLTAUkWQOL5fPGNzE
         UiSjQoQgCCbD822O9dBlOBwzl+Vg8GmLowbUkm3Fma27sj5ipvOpNTGfxjNlZImQucyY
         2hBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2sMII5G/YrPb+0dkZspyZPS9+RZRKOtmg2+pJ+lOQh8=;
        b=IVA3RQ8D3v86UxFVKNfKMwtF9sRN778czebnnIbPck5wV9HHtpbao4ilZpoVUJWbWC
         kE/4hIA8WmdNDGt7oFLfl9deaNbhsapQjO99Epi+BURst9qBGZnSW1XEq4NGlbS2B96X
         vWkFQskTWfYipzDPvi5swGfznCCijjv///CNMlTCVafxmZDh3Wbb5px3g14SkReQMmWO
         xcl2yKYxWL3FaYTRuJr+nYE1rWFUWIYFH9IzXiaXg0YKDZvEsf41GfrKJxNbEKrzv6NW
         ezBt7bIHzn+3j8aiNww4UdONRfigpKs/Sad1SjhG9wAsbHTJPlswBNo41p+qjt8Wmc1z
         5uWQ==
X-Gm-Message-State: AOAM531uFL7cZ9ZsHL5QXnRq+WiB46kgYf2tGgoMe8VyPS9cA0oO7bgq
        N+OIo5WdUyHPHLMqwYTEGaxeB0cSj7a6knRutjZt9w==
X-Google-Smtp-Source: ABdhPJx62hXsE0+fSTYrXfKzc8DzxmmvkPKOdI5TBxPP7euaOB9l5vqd5XytOvYvOyAB9vVojNAO4JW+D+jXmEpzsAs=
X-Received: by 2002:a63:dd0e:: with SMTP id t14mr9405083pgg.279.1629326194463;
 Wed, 18 Aug 2021 15:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210818060533.3569517-1-keescook@chromium.org> <20210818060533.3569517-7-keescook@chromium.org>
In-Reply-To: <20210818060533.3569517-7-keescook@chromium.org>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 18 Aug 2021 15:36:23 -0700
Message-ID: <CAPcyv4hZUOENLxUgqXrzpv0rhHp-TP_EkTaBKjvrsFLjy3-1Vw@mail.gmail.com>
Subject: Re: [PATCH v2 06/63] cxl/core: Replace unions with struct_group()
To:     Kees Cook <keescook@chromium.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alison Schofield <alison.schofield@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Ira Weiny <ira.weiny@intel.com>,
        Ben Widawsky <ben.widawsky@intel.com>,
        linux-cxl@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Wireless List <linux-wireless@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, linux-staging@lists.linux.dev,
        linux-block@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 17, 2021 at 11:06 PM Kees Cook <keescook@chromium.org> wrote:
>
> Use the newly introduced struct_group_typed() macro to clean up the
> declaration of struct cxl_regs.
>
> Cc: Alison Schofield <alison.schofield@intel.com>
> Cc: Vishal Verma <vishal.l.verma@intel.com>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: Ben Widawsky <ben.widawsky@intel.com>
> Cc: linux-cxl@vger.kernel.org
> Suggested-by: Dan Williams <dan.j.williams@intel.com>

Looks good and tests ok here:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
