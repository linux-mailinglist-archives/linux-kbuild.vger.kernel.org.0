Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD22E1891B5
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Mar 2020 00:01:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgCQXBU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Mar 2020 19:01:20 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42857 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbgCQXBU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Mar 2020 19:01:20 -0400
Received: by mail-pf1-f195.google.com with SMTP id x2so12416796pfn.9
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Mar 2020 16:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CLAXJR/m1S5mvbxDH/gOJKQ31fTpJSMrQ/dm5IseVLo=;
        b=nHn8XPpjogArRYq/pgvsanPOK+4o4O576oiPZS+njOPe1Iyb2CbZK5pOPlCvHz+Erq
         ycjuE3lMYgppqAWBDcD1CzbbzRU1NJ+lLGqwcVY1M/ynuQLTbpDg/KVTErnY8WshjnKQ
         dLlK6CXABUAwVSNrHVBjY4SoDTh8u6qiXtVM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CLAXJR/m1S5mvbxDH/gOJKQ31fTpJSMrQ/dm5IseVLo=;
        b=luhEnYd8JLunR9lmXtyXPvEIIWKah3oTtOr6T6k62oTX6tv9LRYf7JzplUth1ZjEiK
         HLJ7RDxEH0Dy2RkzyIydNl9/o7WfCGaqCB2LFrVjlK2kUoyHkqiyjInc2xTDGvsp7KlT
         5lJSerAaB6eu68V+Mn3OSSYdFlMKkys4YQ7atN2rAI4suhviCsfyzqDOqkphB5wp3TVV
         An6CVoeBJFWKGI17VmOyBoKYaIB2oBRLEQ+TLFS/9O0JPyGPVzEGaZo3pQDURf+oiXeM
         wSYxSSFzKhke55vUtEA6RtDqrKMQttSmWr/vqFv0vmQJwyIARFtPFx1W5LOQRsBCWTJ7
         WQ7w==
X-Gm-Message-State: ANhLgQ1MQYVbLHdr1Qhfu4uKBri4wsFxIB8vwMDU2FaJIB3imGuagH/Y
        yuwv51G1iVpinUXHghH+Iw6oMw==
X-Google-Smtp-Source: ADFU+vvg0MZXI74SVi2HiksDnjxAGYalVyFBX2Irz0ufLm1PbI7PXP1Iee6C/syJdSKNKPaBtFiibQ==
X-Received: by 2002:a63:1245:: with SMTP id 5mr1481307pgs.55.1584486078671;
        Tue, 17 Mar 2020 16:01:18 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w15sm1772273pfj.28.2020.03.17.16.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 16:01:17 -0700 (PDT)
Date:   Tue, 17 Mar 2020 16:01:16 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Will Deacon <will@kernel.org>
Cc:     Borislav Petkov <bp@suse.de>, "H.J. Lu" <hjl.tools@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Collingbourne <pcc@google.com>,
        James Morse <james.morse@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/9] arm64/build: Warn on orphan section placement
Message-ID: <202003171558.7E1D46AED6@keescook>
References: <20200228002244.15240-1-keescook@chromium.org>
 <20200228002244.15240-8-keescook@chromium.org>
 <20200317215614.GB20788@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317215614.GB20788@willie-the-truck>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 17, 2020 at 09:56:14PM +0000, Will Deacon wrote:
> On Thu, Feb 27, 2020 at 04:22:42PM -0800, Kees Cook wrote:
> > We don't want to depend on the linker's orphan section placement
> > heuristics as these can vary between linkers, and may change between
> > versions. All sections need to be explicitly named in the linker
> > script.
> > 
> > Explicitly include debug sections when they're present. Add .eh_frame*
> > to discard as it seems that these are still generated even though
> > -fno-asynchronous-unwind-tables is being specified. Add .plt and
> > .data.rel.ro to discards as they are not actually used. Add .got.plt
> > to the image as it does appear to be mapped near .data. Finally enable
> > orphan section warnings.
> 
> Hmm, I don't understand what .got.plt is doing here. Please can you
> elaborate?

I didn't track it down, but it seems to have been present (and merged
into the kernel .data) for a while now. I can try to track this down if
you want?

-- 
Kees Cook
