Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943CF217AD0
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jul 2020 23:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728396AbgGGV73 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Jul 2020 17:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728357AbgGGV73 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jul 2020 17:59:29 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645D1C061755;
        Tue,  7 Jul 2020 14:59:29 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id e13so39691778qkg.5;
        Tue, 07 Jul 2020 14:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0LujZH3tbuUZGpL+nqS5KjyB11nfc4ieFAgqsO06FcQ=;
        b=LrprgMdBbCVp4quez8dlfvVtMub+Odvz2yu07WWstpvYsuUbb4QotlwvYJrZgzgXa3
         LIV3ic16E2kQ+5Z4BxFSLv1qJo8RCXVF3NwuyNgos0lkmpqcsFoU+t5YpkeLSY0AUqYN
         tpkgwHjubJWQ7ifSbuGIWDQft6LXLbizfrPUlrmp4jiCJdt3ZvlFVvy0OHfxrtVkvMbe
         cVqkAx/rkEYHVqaiz1xOhLKkMx2LPa8caaQWG5iJbNG7ZQJJqa4GfHoP6ZvjM9kcaMEf
         dx7PAwLVzxFEyOaQNVOIw10S/GcxtkR+FbQyHt3I0KAlKI9Rb6f1kZIgrcAl2IH7QBU1
         WO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=0LujZH3tbuUZGpL+nqS5KjyB11nfc4ieFAgqsO06FcQ=;
        b=r9gWnsJUnQ9nqu7Mbi4z2U9dcpfRGU2aaXm3qgSTDOqz8BkHqPs3rtFVahNjwdSNNE
         3O8DxHM6KxkMSAJPlzurEA/hFRUfACaZqs6invNPCcgNCLvxyNKHKRXCiaPp8vtbZ9E/
         WwaAibEqCilMMxFb2kTEs6XFjMX4aDkM8Ayf1n2Kig+ze18gfeb6BWgB3jjjPxgaXz4C
         n0ZbUuQqz4qDLnwx6REt0J5pzh9EWzqxPHw50cTz5Yfjet+LyJwsrPF6j+9+EmqeIIgB
         +qm9FQanQQEHnMvn+Vy2v3GaG024LqLUfOO0cRdXQhqQE4/HgKPNMqs6TTFxqjEf90/Z
         tm6A==
X-Gm-Message-State: AOAM531w0VIKUuzeXwht1vB+ZbsMknDNd6Nd6dCYCaB+pfigHToWvxMX
        qj5m4yqdfMf19Wr11uq7VEE=
X-Google-Smtp-Source: ABdhPJxUZqZB2fqVPgzHgDgpuScL+9miiipK7SwKP1XY2jR0266CmUPrnavXP7+cXWr85pfmgFDjOw==
X-Received: by 2002:a37:a316:: with SMTP id m22mr55887513qke.378.1594159167658;
        Tue, 07 Jul 2020 14:59:27 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id p66sm25301009qkf.58.2020.07.07.14.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 14:59:27 -0700 (PDT)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Tue, 7 Jul 2020 17:59:25 -0400
To:     Nick Terrell <nickrterrell@gmail.com>
Cc:     Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nick Terrell <terrelln@fb.com>
Subject: Re: [PATCH v6 2/8] lib: prepare xxhash for preboot environment
Message-ID: <20200707215925.GA1591079@rani.riverdale.lan>
References: <20200707034604.1539157-1-nickrterrell@gmail.com>
 <20200707034604.1539157-3-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200707034604.1539157-3-nickrterrell@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jul 06, 2020 at 08:45:58PM -0700, Nick Terrell wrote:
> From: Nick Terrell <terrelln@fb.com>
> 
> Don't export symbols if XXH_PREBOOT is defined.
> 
> This change is necessary to get xxhash to work in a preboot environment,
> which is needed to support zstd-compressed kernels.

The usual way to do it is by adding -D__DISABLE_EXPORTS to the CFLAGS, which will
cause EXPORT_SYMBOL to be stubbed out. Doesn't that work here?
