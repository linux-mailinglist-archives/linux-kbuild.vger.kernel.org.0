Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9E5F443D66
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Nov 2021 07:47:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231740AbhKCGuU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Nov 2021 02:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231558AbhKCGuS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Nov 2021 02:50:18 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F946C061714;
        Tue,  2 Nov 2021 23:47:42 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id fv9-20020a17090b0e8900b001a6a5ab1392so659421pjb.1;
        Tue, 02 Nov 2021 23:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:in-reply-to;
        bh=udPkkzw77DTBgiWFv+jDl0B7cJpy+vNaTBldIsKb7YU=;
        b=gPQYE0EfpZKymJn0JfJtaig1VbBp5O6q10AYEAJ/wroSS1R7TqH/K0Owarjttl1SUl
         nz5lOYg4XWmiI5u4FwqW5ka0jIlAo4ygZXCwCJ7St2TIMgE22jkxRwcLEGpYz0hP6kie
         OtSoHRzxX/bOrqmPDVYBiY8UC4zFtUTPHPZdxwVcYcHseoGd8TyOBz7ip4WlztRh2Fsl
         XgZ/OyP9FHjXKcCXQeiWRzBXyORdqqIzJQqMlmMHGmH7IeFTl15/q6Uk+ElAt3tonZxA
         U9jILkOb192XhsDYoMrt1dfCvdgXz3Y2x4g9j2DzbdjAqfjBDe+xiN5XwPhvQLMC0F5m
         EiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:in-reply-to;
        bh=udPkkzw77DTBgiWFv+jDl0B7cJpy+vNaTBldIsKb7YU=;
        b=6FeuflvffAKFmKIDfQx5FCBwEfM+WrY72E+pevTME33u43f47UnT89bET/ECQyD7/J
         XAj1/BIDI8PCMOB5EYSb9SgexnhM4StKSnupHCgF/BFoJdPXqt4PuWt9KxN79RmjnDwP
         gS0AtpfIhWp5fuMjQIW+ocaIt2BA09lCsNSgV9goA3JGKKHNfeJdeHg693zA1ToZjvlg
         /GbLQmQSIU2LSROLBH76Q72pCK5WErC/hpCtW2snklle8shA5uhcvrzzC9o4ZyPLTN19
         HkpJ59EXwHfPqC8AHaKx5XKcXesFmp7U8avEaEzjzlYchY+iQl90tr1FR/Q9Mxhg7f4D
         V1zw==
X-Gm-Message-State: AOAM530USF+1g3zQDDvItgNk3AWZ1dOwv2MezSotD8z6C3mbqEMYKPy9
        vAOtbTlO5pZDQCfa9SntVdo=
X-Google-Smtp-Source: ABdhPJzcVFTFBmrXML8vscz9nLQ3iutTEbADnmFFWlkkeip/8NRI3S7OAwGa5HyaxnwinzrR73wqwQ==
X-Received: by 2002:a17:90a:158f:: with SMTP id m15mr12675093pja.200.1635922062044;
        Tue, 02 Nov 2021 23:47:42 -0700 (PDT)
Received: from localhost ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id x20sm899165pjp.48.2021.11.02.23.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 23:47:41 -0700 (PDT)
Message-ID: <6182308d.1c69fb81.3bfeb.35d2@mx.google.com>
X-Google-Original-Message-ID: <20211103064740.GA26863@cgel.zte@gmail.com>
Date:   Wed, 3 Nov 2021 06:47:40 +0000
From:   CGEL <cgel.zte@gmail.com>
To:     Song Liu <song@kernel.org>
Cc:     Paul Menzel <pmenzel@molgen.mpg.de>, linux-kbuild@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>, zealci@zte.com.cn,
        yang.guang5@zte.com.cn
Subject: Re: [PATCH v2] raid5-ppl: use swap() to make code cleaner
References: <7e805797dd70bc40aac9343f82548324ba28cd72.1635407415.git.yang.guang5@zte.com.cn>
 <CAPhsuW7acBzC--jdGTuiV6gJYn6uJE--J-MLLjcipW1oEMTT=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPhsuW7acBzC--jdGTuiV6gJYn6uJE--J-MLLjcipW1oEMTT=w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Song,

Because we don't have right to send out email by @zte.com.cn.
So we all use cgel.zte@gmail.com to send out email and sign by echo one own @zte.com.cn email.
My email is yang.guang5@zte.com.cn.
Signed-off-by: Yang Guang <yang.guang5@zte.com.cn>
Thank you!

On Tue, Nov 02, 2021 at 11:09:07PM -0700, Song Liu wrote:
> On Thu, Oct 28, 2021 at 1:48 AM <cgel.zte@gmail.com> wrote:
> 
> By the way, who is the owner of cgel.zte@gmail.com? I see the same
> account sending patches for different authors. If it is one person sending
> patches for another person, we need "Signed-off-by" from both of them.
> 
> Thanks,
> Song
