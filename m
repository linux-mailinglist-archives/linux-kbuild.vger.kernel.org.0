Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28E741589BD
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2020 06:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727959AbgBKFrF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 11 Feb 2020 00:47:05 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39946 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727933AbgBKFrF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Feb 2020 00:47:05 -0500
Received: by mail-wr1-f68.google.com with SMTP id t3so10648791wru.7
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Feb 2020 21:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qWrsS+QASh0VnDSpOZ/Wnsp1Hr5EKZDv5wZErgwP/84=;
        b=Nm/NEs15lW64c8argGiwTcBEbVUb0gQgIM0kfxkLF1v8FJkdkCtRYn2wUWRZ64GUO7
         t9aWDvdKmM3QE8oo3hw+WCyqpL+NWpg836nftC+eLHg1BtepUCTenhYWlSWu2S8+lNgT
         soUS0Pt4ZncmbJhSdhv/PvsfSlCw+/ZVbWly+hvWv1MCQXmKcl4VnSA46EFVqcrI/qgw
         xhvNtBNFdFj3MyuYLe2yPUEEgLZfMoK+xF+KQOKHiI0PI3ZzbHMB9MSvm5Pi4mFxu1k6
         81XENqD3f3nTZB9Wg/7JOoIdlhjqhTk2eEbavqNtkJYhKz3xyEGnMv4+RSPD2RmokUz+
         CKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qWrsS+QASh0VnDSpOZ/Wnsp1Hr5EKZDv5wZErgwP/84=;
        b=g5OQRBdKtISsAvWX/r6kKXqvolod2jSJrIN6JMlnsnfgulhie5w4KArJSlifWcebj5
         8dcgXsGgng5sS2kxdaGEQDYWwSexp+kDilHHrDpt30nbWjrHce6YRfj1tYfcWZZ9yOPa
         V3DcRbo59CuduVjMbUUZZb4KvKtUg+MTTgITOHFdcUvX8oe/1tnHea4vMJNDs+LrYZZg
         gTml6EGXOt/PKmRyL1Y/rxi63LH73lq2Vmu9YjxtHNaBZdtKJtAlRv7n4du14Cf1ig4m
         5x1f6phgWTIHX0FCGrxsRxGQy5LxGGBDhI4WjWhNWW6PLE3JbaDPeSA6veX4m63c0bTD
         gQTQ==
X-Gm-Message-State: APjAAAUckpYayC5meu+ljuaje9Q18OYMEFl1/HYKz6AW/T3dlAmAQZIV
        1P9eiyH0ccw5G43XSmqHcYahbA==
X-Google-Smtp-Source: APXvYqzyBhumtAUDVOmSRQ4O5OxJR3ut0I4eBxpxskJWm16xRxZUywOQfbLvn+xa+aMMQfVE+eTJdQ==
X-Received: by 2002:a5d:4ac8:: with SMTP id y8mr6209970wrs.272.1581400022991;
        Mon, 10 Feb 2020 21:47:02 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id d16sm4183813wrg.27.2020.02.10.21.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 21:47:02 -0800 (PST)
Date:   Tue, 11 Feb 2020 05:46:59 +0000
From:   Quentin Perret <qperret@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nicolas Pitre <nico@fluxnic.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Matthias Maennich <maennich@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Jessica Yu <jeyu@kernel.org>,
        Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 3/3] kbuild: generate autoksyms.h early
Message-ID: <20200211054659.GD72419@google.com>
References: <20200207180755.100561-1-qperret@google.com>
 <20200207180755.100561-4-qperret@google.com>
 <CAK7LNAT+Xw8ntYcrcMtLrekkgziaHU+7nvzdh5tqD0cbe8pJhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAT+Xw8ntYcrcMtLrekkgziaHU+7nvzdh5tqD0cbe8pJhw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Saturday 08 Feb 2020 at 06:09:06 (+0100), Masahiro Yamada wrote:
> Now that this line is doing a non-trivial task,
> it might be a good idea to show a short log, like this:
> 
>   GEN     include/generated/autoksyms.h

Sounds good.

> You can do it like this:
> 
> 
> quiet_cmd_autoksyms_h = GEN     $@
>       cmd_autoksyms_h = mkdir -p $(dir $@); $(BASH)
> $(srctree)/scripts/gen_autoksyms.sh $@
> 
> $(autoksyms_h):
>         $(call cmd,autoksyms_h)

Nice, thanks for sharing!
Quentin
