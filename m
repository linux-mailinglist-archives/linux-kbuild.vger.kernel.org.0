Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5FE922FF8D
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Jul 2020 04:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbgG1CYM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Jul 2020 22:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgG1CYM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Jul 2020 22:24:12 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1730C061794;
        Mon, 27 Jul 2020 19:24:11 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id x69so17385261qkb.1;
        Mon, 27 Jul 2020 19:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lIlJ51rGXRMUnJksSFkB+ZvhhBvB4xCOXzVc7Skm02k=;
        b=Zqc3wYsRnhwYE3AP5dWsxTAUSpUOqKMdI1SbLqN9V1qpJFZtvauPY1OOFP32EptMGh
         9THvCr+lwyhvYarjR1SlJb4RH53buPSxYQJaATgiJBayCcAIO0Pv4ZJ2T6WD8GEC1HM1
         mp5/24o1x3GPSlUtllsXCvX9nRhaQ1AW++V5RM+XhF31rYquGMI8MstAyUoiUm846Enj
         /UPBuO89A6RBNZ2Pt/pxHAQOSxJii4O5S57uCUUaUi4B4vHJevIkiwwaGW6vVWhGJN5G
         UVohTbj6GuniOog/anNGi6TceCzmGFX8T15smHJo1Eq24NzQVuL2HlllmMDm1etEVBwn
         dGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=lIlJ51rGXRMUnJksSFkB+ZvhhBvB4xCOXzVc7Skm02k=;
        b=MA484JNnoAgwloDB42EKavEC7nUd/pPPeA1tdCHZdz16rh0Ur4i9sxGsegERTawWny
         48xyBp0ZX2Dz+0qRhWlC6LkARqVDGMWtaf/Vy5CHDai2O9AbNqeQd24ldX9YsHKJD33p
         3mvg0s0cE5Bd1rBfEIegPiPh0WKV4O6DQpUJJBNnUmAK3eMNbtUtFiwGY0JMzRbn/hmu
         V1VQjVceBsR45/CWqksQIEujyKASmVx8CPUB6gAtOoBOfZI+vvafqJq82JonnkqNCw2s
         FMmJtRvhZPmb1F/uooDKqpayIPeFL9t5pm3bm7lCF3wIQSPQamevVBJLuZOSp6l7Igku
         c8cA==
X-Gm-Message-State: AOAM533VOKPyT6n4zgdTOxRi29rdJHhk1fX2n6w3xtxAnUTDPOlB3QxO
        AHeNWfJP7+f7TJ50XchIkE8=
X-Google-Smtp-Source: ABdhPJzFokcEU90QjcaaExhllaSgZzo4ReUkGE1Cymq3kb1TSqEdcR8HlaIdS6xD/WlZvgI2i5+Qyw==
X-Received: by 2002:a05:620a:227:: with SMTP id u7mr25613448qkm.75.1595903051099;
        Mon, 27 Jul 2020 19:24:11 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id 103sm11598103qta.31.2020.07.27.19.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 19:24:10 -0700 (PDT)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Mon, 27 Jul 2020 22:24:08 -0400
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
        Alex Xu <alex_y_xu@yahoo.ca>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Nick Terrell <terrelln@fb.com>
Subject: Re: [PATCH v9 6/7] x86: Add support for ZSTD compressed kernel
Message-ID: <20200728022408.GA3553606@rani.riverdale.lan>
References: <20200727230606.906598-1-nickrterrell@gmail.com>
 <20200727230606.906598-7-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200727230606.906598-7-nickrterrell@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jul 27, 2020 at 04:06:05PM -0700, Nick Terrell wrote:
> From: Nick Terrell <terrelln@fb.com>
> 
> * Define __DISABLE_EXPORTS in misc.c
...
> __DISABLE_EXPORTS is defined in misc.c instead of the Makefile because
> kaslr.c defines __DISABLE_EXPORTS, and defining it in the Makefile gives
> duplicate definition warnings.
> 
I think the commit message missed getting updated?

Thanks.
