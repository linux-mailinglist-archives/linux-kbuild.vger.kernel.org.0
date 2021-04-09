Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59AEF3592AE
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Apr 2021 05:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233339AbhDIDKw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Apr 2021 23:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233342AbhDIDKq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Apr 2021 23:10:46 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 166A9C061760
        for <linux-kbuild@vger.kernel.org>; Thu,  8 Apr 2021 20:10:34 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id p10so2070610pld.0
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Apr 2021 20:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hj2e4tOPKWFtCRvrQal3o3zq1C/rQT1FUQHIipwcQ0I=;
        b=P5xYmHMGYiIemNIHrTp5wsrVPgnYvkka70bkhuyrpYHxY0P2jhw9nBaPf3jCYXiYNQ
         jpgKJl1u8FyowK68jPTohoYxhIfRzJbIFSCJL+6jE4qWnsI7lYfpbFjX1WJi2w9dEGb3
         rOmPfxJ5SmXydLDq1UVd0i3blEw1Rh6Zt/WpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hj2e4tOPKWFtCRvrQal3o3zq1C/rQT1FUQHIipwcQ0I=;
        b=VWkpR5xhBM/7X8KWZ/L2Wd1mCQQXX9qJeJ99GTCRMVUGG9UXth6HSayLhrB3676waS
         ApTB2l/lRh0qUMEoIzYTUIl3DrgJYIO383W2vUxg4JiZYgC5v1moPwxBbKxjLUd84Ynh
         1iip1GPELew2cxyFlUf8MYBXYq0WDXdv2F1QT+IeL7NUjjoRyggkI+Qy7eVaWyTnUO3T
         FVwGgg9+OElOjBK09UX2q4VNtHSiQnGCuxFKlZloPRQMLuozZIiuhL9azveMkI0X6jz2
         bE4f9rzf6G5z6RVg666gLYPTwbGzkmqEKE32WEoeTkYiPuHUWaRP1XeKzwv8srkhZmYJ
         3Ykg==
X-Gm-Message-State: AOAM530x9xAKz3ltPdm6witm9ZitYC/uGSyWNo3RhgDw++EG3ICyKgBX
        l9z0mDwo26u6I9zeto2tUbEPvw==
X-Google-Smtp-Source: ABdhPJy86I8REcS1f5f3fDODwBAAmm/w9DjfgauoZ9oimaz2V9pIRrZ7oqoKE5RO80QxvyAmngNAKg==
X-Received: by 2002:a17:90a:66c5:: with SMTP id z5mr11681320pjl.172.1617937833727;
        Thu, 08 Apr 2021 20:10:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id iq12sm633534pjb.9.2021.04.08.20.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 20:10:33 -0700 (PDT)
Date:   Thu, 8 Apr 2021 20:10:32 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-s390@vger.kernel.org
Subject: Re: [PATCH 17/20] kbuild: s390: use common install script
Message-ID: <202104082010.E50A29A@keescook>
References: <20210407053419.449796-1-gregkh@linuxfoundation.org>
 <20210407053419.449796-18-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407053419.449796-18-gregkh@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 07, 2021 at 07:34:16AM +0200, Greg Kroah-Hartman wrote:
> The common scripts/install.sh script will now work for s390, no changes
> needed.  So call that instead and delete the s390-only install script.
> 
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: linux-s390@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
