Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16A4316B494
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2020 23:53:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbgBXWw4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 24 Feb 2020 17:52:56 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43955 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbgBXWw4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Feb 2020 17:52:56 -0500
Received: by mail-oi1-f194.google.com with SMTP id p125so10634931oif.10;
        Mon, 24 Feb 2020 14:52:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2VGkRfLiHvM2TWoSDShwRBkAOB7OyJ3X9em7omr73hg=;
        b=JO+kAFrf5uz60OOx2SG2USFXgkpYVjScYrp33umKi7Ga8H71UaYNyNoZuqLExWDGuV
         +0UTk/U+n6VVpKJtklzH/iErZshjOUUVg5twjZ0QmJu0dunwGW2c6wWf9ds+moEd9zH9
         h0UlxeEEnCLBfndkNLCiHOmNVpgbVuhig4DO0X/J4UMXBtpuAQD+rYMIXawL6PyBxmon
         TOV7N6oz5LV1RF4DMWvjdNNsey5SoiouNz1ytU+4J9zJ1WmaqUQI95vHzDeMsMtVk/wj
         yLW/Z97rU4SJUFn5wf3zz2ojGq9Vd6RAqUCP3Y22MvGBtgwxoe5XSYvz0uUEq9VHnMLl
         1CJQ==
X-Gm-Message-State: APjAAAXznrNc+LrJuWhzbfWL6erptJGQeEPCszHPFdbTiapuamigitMK
        8PsZ7lFIUDIPuU0M9IGE6f0ogzc=
X-Google-Smtp-Source: APXvYqxNziUsuA47UX0NTr+m+tVpLc9FqF9UWCb6tSYpAhM7QwzWHHXBED+wGh7of/+ZHnbcD464yA==
X-Received: by 2002:aca:b588:: with SMTP id e130mr1145135oif.176.1582584774399;
        Mon, 24 Feb 2020 14:52:54 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m22sm4971939otj.3.2020.02.24.14.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 14:52:53 -0800 (PST)
Received: (nullmailer pid 10835 invoked by uid 1000);
        Mon, 24 Feb 2020 22:52:53 -0000
Date:   Mon, 24 Feb 2020 16:52:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] kbuild: fix DT binding schema rule to detect command
 line changes
Message-ID: <20200224225253.GA27948@bogus>
References: <20200222190435.11767-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200222190435.11767-1-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Feb 23, 2020 at 04:04:31AM +0900, Masahiro Yamada wrote:
> This if_change_rule is not working; it cannot detect any command line
> changes.
> 
> The reason is because cmd-check in scripts/Kbuild.include compares
> $(cmd_$@) and $(cmd_$1), but cmd_dtc_dt_yaml does not exist here.
> 
> For if_change_rule to work properly, the stem part of cmd_* and rule_*
> must match. Because this cmd_and_fixdep invokes cmd_dtc, this rule must
> be named rule_dtc.
> 
> Fixes: 4f0e3a57d6eb ("kbuild: Add support for DT binding schema checks")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/Makefile.lib | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

For the series,

Acked-by: Rob Herring <robh@kernel.org>

I'm assuming you will take these? If not, I can in the DT tree.

Rob
