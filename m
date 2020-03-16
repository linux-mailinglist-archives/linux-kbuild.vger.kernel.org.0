Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87D38186D2D
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2020 15:35:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731538AbgCPOfZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Mar 2020 10:35:25 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53852 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731535AbgCPOfZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Mar 2020 10:35:25 -0400
Received: by mail-wm1-f67.google.com with SMTP id 25so17928969wmk.3
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2020 07:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=malat-biz.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7125kSM8GMUB8y9raczD1iv7Q58tZuupwW4N/jfaeU0=;
        b=NH6Mv9eN6z4oBwi+JI9/4E9loJl0Cl1wxjcdEEtVjSATZxVcvAOa8U7kAOn45SMuMe
         wTjwXmmrC63EPg874jpi/Bp5ybDkWeeDJncEZAUkYEjUXIyoVWRec4vc1vM/O9o3hATX
         8wgJBeSk2vZ2JjQpSxxUl4aEQm/Uk9VtivSs4BqQoLWBbAbZ876/JmJ2yuuiWX1vZn1e
         o8/J+M20yVu3vd02oqVw1/0Ge7ru5bnpdukFoO0/X8jUx0zNI1CailqDctHGB+62LU4K
         ba7SVaCzsZYfJmb92ABPYnHvw7qL7xJHrbLFxZZ9LOy6aG1HU2WuLMwHQXTDAFlluIn5
         /OtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7125kSM8GMUB8y9raczD1iv7Q58tZuupwW4N/jfaeU0=;
        b=J3mREWJKM85E7Dc9LBIlCVM9f6o9qE4j6ORRlOKEedccAV2u242PrGcy869+mG8kUC
         83kVyuXndSQbL7rTWWZxDTESeE+ggeM97Blo4URFwwtbWyplEuYOcDtMXFMQuIzZeGqw
         PRSiWsg5WlAR4FxtQdG3YF+2aoMYGDK6mmcKGJph+LqeFtnyCIo2jcqcHW5rj5Q3mCHl
         YQjuCEeUbt5fnt5Mg7AbQpzxCEetbHAlN/tf12R7/RzqEbpgsysUqGOHEdB1ChPrKoTp
         tgBI1vLRYjJtfezbxaKJPVWeJdt5w5YqlI8q4pPGMHsez+V+BwDykQv4lSnHnfMwcZoj
         kSeA==
X-Gm-Message-State: ANhLgQ0BuGsNDqwh42yGBHfKOSCVSHkiy7Vmk5nM31gqLix0fwfG+yhw
        SdM050Oj8p1oBGVesBxuK+H1Hw==
X-Google-Smtp-Source: ADFU+vsO8sc39CQsOFpLoEzniz7yzWlT7UBqrXKqb0GTUik0+v2y16xLGBzFHS+BX5BwicX5xz0PCw==
X-Received: by 2002:a1c:20c6:: with SMTP id g189mr29420954wmg.163.1584369322464;
        Mon, 16 Mar 2020 07:35:22 -0700 (PDT)
Received: from ntb.petris.klfree.czf (p57AF9474.dip0.t-ipconnect.de. [87.175.148.116])
        by smtp.gmail.com with ESMTPSA id y80sm14361021wmc.45.2020.03.16.07.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 07:35:21 -0700 (PDT)
Date:   Mon, 16 Mar 2020 15:35:05 +0100
From:   Petr Malat <oss@malat.biz>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        x86@kernel.org, terrelln@fb.com, clm@fb.com, keescook@chromium.org
Subject: Re: [PATCH 1/2] lib: add support for ZSTD-compressed kernel
Message-ID: <20200316143505.GA1449@ntb.petris.klfree.czf>
References: <20200316135025.7579-1-oss@malat.biz>
 <20200316140726.GA4041840@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200316140726.GA4041840@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I have extended the description, thx.
  Petr

On Mon, Mar 16, 2020 at 03:07:26PM +0100, Greg KH wrote:
> On Mon, Mar 16, 2020 at 02:50:24PM +0100, Petr Malat wrote:
> > Add support for extracting ZSTD-compressed kernel images, as well as
> > ZSTD-compressed initramfs.
> > 
> > Signed-off-by: Petr Malat <oss@malat.biz>
> 
> That says _what_ you did here, but not _why_ you did this, or why anyone
> would even want this.
> 
> thanks,
> 
> greg k-h
