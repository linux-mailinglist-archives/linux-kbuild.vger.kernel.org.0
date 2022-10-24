Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4B5760B648
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Oct 2022 20:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232489AbiJXSxa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 24 Oct 2022 14:53:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232774AbiJXSwz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Oct 2022 14:52:55 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9CBA11159
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Oct 2022 10:34:24 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id p3so8096583pld.10
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Oct 2022 10:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GDEbqRU8sq/kF2yRisiLgzU2HDxDOJoWb1vd6nz9uGU=;
        b=HnE1HY/lybPVFDB3zY/UJbK9AFVb+TSrUcgGvtOeU6QkvpRGeROW6dXTcNAUBtN+0l
         hyLL+Sxv44XqoB8Y3JQfHrkdy9RJKCOukBkjNycRA+DXPZKbEIEXMTPx1qX9l+OP1Iln
         Ci9XvTon4wufg6WV5poCy+kcBC4Jq9mWMkp/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDEbqRU8sq/kF2yRisiLgzU2HDxDOJoWb1vd6nz9uGU=;
        b=N9pjmPYR9897lb5WKZF4HXom73MweLwwOgTJTHuBCZfcO0EFw/DQqx5t8I8fO8P9wO
         naGsdrgzJ9fK6YQRniBQ0DQgxlLnwn0aaHy4p3U75PsNWNFrvdAPDubBdWqktPqWNzDU
         vCT7QXo4yMVWQE43upxrMi4hQWgSqWpM6zePW+6/6iKGkZauXRHKe34UH4WB3mRJgyKU
         AmYjYHcFsUDEolykYY4pY41Zv2Tvvj59eCRm8wDbrY0Nip1BpNv5XcgVQQ7F1JKxr80I
         IMcgxdVf/zYfL6z4uZ0L8m/X/WCIbiJTGcBvfcY2CaAa05JgP6SGLoUy7+hpFKUUjSN5
         6XMw==
X-Gm-Message-State: ACrzQf2f2jgN55Xi3ATVVJqZ7MHD9xD4CDZa5AS03yzGiqVw4PKfec/B
        /9xLDoBjYGnRyzbgUjWP+fyV+Q==
X-Google-Smtp-Source: AMsMyM5cwsymEhwq0BzYOsKfaqYpuQay0bmcMDUOWqTrARXwFCvkTtuhuNWAJSK43cbAt5aIcH6UGg==
X-Received: by 2002:a17:90b:38d1:b0:20d:8f2a:c4c4 with SMTP id nn17-20020a17090b38d100b0020d8f2ac4c4mr73462283pjb.192.1666632780418;
        Mon, 24 Oct 2022 10:33:00 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a65-20020a624d44000000b00540f96b7936sm87029pfb.30.2022.10.24.10.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 10:32:59 -0700 (PDT)
Date:   Mon, 24 Oct 2022 10:32:58 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Xin Li <xin3.li@intel.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, x86@kernel.org,
        andrew.cooper3@citrix.com, hpa@zytor.com, peterz@infradead.org
Subject: Re: [PATCH 1/1] kbuild: upgrade the orphan section warning to an
 error if CONFIG_WERROR is set
Message-ID: <202210241031.4BB6E70FB@keescook>
References: <20221022030519.9505-1-xin3.li@intel.com>
 <20221022030519.9505-2-xin3.li@intel.com>
 <Y1bLk47I4pyEmJVi@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1bLk47I4pyEmJVi@dev-arch.thelio-3990X>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 24, 2022 at 10:29:55AM -0700, Nathan Chancellor wrote:
> On Fri, Oct 21, 2022 at 08:05:19PM -0700, Xin Li wrote:
> > Andrew Cooper suggested upgrading the orphan section warning to a hard link
> > error. However Nathan Chancellor said outright turning the warning into an
> > error with no escape hatch might be too aggressive, as we have had these
> > warnings triggered by new compiler generated sections, and suggested turning
> > orphan sections into an error only if CONFIG_WERROR is set. Kees Cook echoed
> > and emphasized that the mandate from Linus is that we should avoid breaking
> > builds. It wrecks bisection, it causes problems across compiler versions, etc.
> > 
> > Thus upgrade the orphan section warning to a hard link error only if
> > CONFIG_WERROR is set.
> > 
> > Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Suggested-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Xin Li <xin3.li@intel.com>
> 
> Thanks for the patch!
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> 
> We could deduplicate the '$(if $(CONFIG_WERROR),error,warn)' logic if we
> hoisted it into Kconfig by having something like
> 
>     config LD_ORPHAN_WARN_LEVEL
>         string
>         depends on LD_ORPHAN_WARN
>         default "error" if WERROR
>         default "warn"
> 
> in init/Kconfig then using it everywhere like
> 
>     --orphan-handling=$(CONFIG_LD_ORPHAN_WARN_LEVEL)
> 
> but I will let others decide if they would prefer that over the
> direction we went here.

I think this makes it look cleaner, yeah.

-- 
Kees Cook
