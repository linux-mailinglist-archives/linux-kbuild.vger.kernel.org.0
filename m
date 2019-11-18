Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 774D1100753
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Nov 2019 15:26:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbfKRO03 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Nov 2019 09:26:29 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:41817 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbfKRO02 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Nov 2019 09:26:28 -0500
Received: by mail-io1-f67.google.com with SMTP id r144so18902474iod.8
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Nov 2019 06:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=du0XHpmLviazuqr3BCaTDTx0qFpy8dgUcEPCv5dSJV8=;
        b=zs8hejVgqws+v5Gu+l9yMA4nopGmUwQZjUJnjQUVogqktbkEW14DoBX4fxmhG7BB/e
         rbN4UCFmLnNygIsV39ni0tlA4BEAF0c/APLGD/ZTa+LkBHNC46Fe71TDJYmAFLebNyxc
         bjaWoImPEfZG6H9WC5To7FeQBMDduWzgs+/SQjH9lBAkeDWDxYkTO3ubICGofpdVvKus
         0b1z9986UfZvNv5urlsR3h80NV7YEjLnLNftaCkm9rwMdgd1Ag+TcSv1BI3Ew39zHT4p
         vT2DE3u4vKl39KI8bmFDHR0/j76auj782kQxmZCHQSZQP9FsM4utTEaiaBiseC/CF4qq
         /wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=du0XHpmLviazuqr3BCaTDTx0qFpy8dgUcEPCv5dSJV8=;
        b=ffcszUYxtuM0uC9CIR9PzUqcRVsyeDSZcFHIQb2n7lHzj6K2mEis6QnOQs9Nkv0Qcz
         q9xxza5MyTDE0Gt42ICABRaD9xOVXCOnQOibkkSa2rMuU424zCT8teQO/JKUStkoxxv8
         5w7+0WkNMoMwOHpKm+82RjJ3dNq76Hb9qyK4UFNf2j7+36jtyp4u8lMBsW1aa+KCGBLL
         d0OIrKogm3vx0krBFFkRydjX3wKgLakUcBdYt+Vgwf4xXHLoaTFUaoPTHr9dgyPYLt4M
         8v00u6eIw36DXmfzseCoQZDhEZ0dCYXk9u7hjeIDd91t/TfBQJyVEStt/hSIY4+XH8rf
         NcqA==
X-Gm-Message-State: APjAAAV2HNv2F5Xjyg9fqcQAV7CsA+I3u7B9BbaoL0lUCgJDGxuHpnFU
        R5SYSaN0AQGmubtan3ELAdKM9/TtK/k=
X-Google-Smtp-Source: APXvYqxho+itgdP4ffBUh8zwnHiMwlXoVhy59Svd9UMWT0O5v/ZjRugfj87x35RO8m6Uyxka3HtgRw==
X-Received: by 2002:a5e:d716:: with SMTP id v22mr13226365iom.152.1574087187154;
        Mon, 18 Nov 2019 06:26:27 -0800 (PST)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id e4sm4534244ilg.33.2019.11.18.06.26.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Nov 2019 06:26:26 -0800 (PST)
Subject: Re: [PATCH] kbuild: make single target builds even faster
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org
Cc:     Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
References: <20191118045247.14082-1-yamada.masahiro@socionext.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <2b1ab1b1-dd20-31f7-c787-921cbd66a828@kernel.dk>
Date:   Mon, 18 Nov 2019 07:26:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191118045247.14082-1-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11/17/19 9:52 PM, Masahiro Yamada wrote:
> Commit 2dffd23f81a3 ("kbuild: make single target builds much faster")
> made the situation much better.
> 
> To improve it even more, apply the similar idea to the top Makefile.
> Trim unrelated directories from build-dirs.
> 
> The single build code must be moved above the 'descend' target.

I tested linux-next, which does improve things a bit, and this one on
top further improves it. We're now not THAT far off the situation
before these changes, that's a huge win. Thanks for working on this!

You can add:

Tested-by: Jens Axboe <axboe@kernel.dk>

to the commit, if you wish.

-- 
Jens Axboe

