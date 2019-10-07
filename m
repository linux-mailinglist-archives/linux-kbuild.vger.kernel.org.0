Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1AF2CE3F2
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Oct 2019 15:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbfJGNl3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Oct 2019 09:41:29 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:56294 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727940AbfJGNl2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Oct 2019 09:41:28 -0400
Received: by mail-wm1-f67.google.com with SMTP id a6so12716901wma.5
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Oct 2019 06:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=a1DymUfYCUkBtLvKqZBG2BDJK0pFyy+uWvMSL42B6Ss=;
        b=W+Y5I+rbCETeTd3zSOtYINoNLECYEKqOmhtqTDAd1Oki295s5IQtHYwqbc3NbI4nf3
         BcOnfzMjw31CCtBohix4nCsX/ovthQRffdaTxLQFYkZ6C0w34Hb8p3Kw/vcwipt7qf/H
         gn85JdL4z303jrta9oDlhYG+mfWQb8MpxLAS+EknwKnuh2lT0FMQehMwpPl1ygXKCkVl
         0IUxjvmC6557Jw9u3Aa6kay/D+E7sphEIwo88kx6zdhRCFwHBCdotdIqTlJgoKRKQvnR
         bAj+c922mMlcWjczESBx31xUbX0rdz/Zg97eo+F2TyyWtFe7mT2PVD5I5bmxWKR/iPTo
         o0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=a1DymUfYCUkBtLvKqZBG2BDJK0pFyy+uWvMSL42B6Ss=;
        b=ep+WPHOwIpmcIZsQWgk0XVQt96E5KcFW7z8vJzX+b80bG7TfWnJR23tK4zE60PoXvy
         566jGt7U2DtLbvI0kRWvet8szUSWtqoh022tsspowVGiObiEVQzGadjEux91SOJvFPB4
         4ilkUhIiZiqfdai06uOHnr3gDK9ufYj4d+HrEO/y/Gc6uVUVs8XSuydysohkcp/CXVPQ
         AwzdhoW1P8TO5td3JIJuNQteq2c3z8MayvhRG681g9u8jOpayW30kopexTg5em+beNlz
         hpfOidDeQdP1HykD2WIpGewZnu+f/TOqL45/eQsA16jAHqqBi9hbSiXxYhGeEJddiFlA
         Gr+A==
X-Gm-Message-State: APjAAAUOo4/U8rpFS38L1LPf4qXh+IrVaPe1FxcbbW8RI+VSIN6Hjkjf
        AmG3EinfPLPFgIbP8mdVz46fOA==
X-Google-Smtp-Source: APXvYqwgPFTmDn3M4fzkA7mrblggHx7Q7ntMyvm4KAu41hDTlk9sb7yTHRIPd7komTwCEFCCQJnQ2Q==
X-Received: by 2002:a1c:720a:: with SMTP id n10mr21937845wmc.0.1570455686279;
        Mon, 07 Oct 2019 06:41:26 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
        by smtp.gmail.com with ESMTPSA id z189sm15872884wmc.25.2019.10.07.06.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 06:41:25 -0700 (PDT)
Date:   Mon, 7 Oct 2019 14:41:24 +0100
From:   Matthias Maennich <maennich@google.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Adam Zerella <adam.zerella@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc: move namespaces.rst out of kbuild directory
Message-ID: <20191007134124.GC23938@google.com>
References: <20191007043611.31036-1-yamada.masahiro@socionext.com>
 <20191007060614.GA142813@google.com>
 <20191007081241.GA8279@linux-8ccs>
 <20191007072930.07b1e90a@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191007072930.07b1e90a@lwn.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 07, 2019 at 07:29:30AM -0600, Jonathan Corbet wrote:
>On Mon, 7 Oct 2019 10:12:42 +0200
>Jessica Yu <jeyu@kernel.org> wrote:
>
>> This was my line of thought as well, since the audience of
>> admin-guide/ is sysadmins and users. Namespaces are mostly relevant to
>> module authors and kernel developers. Currently, I don't think there
>> is an existing good place in Documentation/ for this topic :-/
>> I suppose kernel-hacking/ might be the closest fit, as Adam suggested.
>
>I didn't see this thread before responding in the first, naturally...
>
>I think the core-api manual is probably as good a place as any for this.
>Changing the name to something like symbol-namespaces.rst is probably a
>good idea, since most people think of other things when they see
>"namespaces".  Or perhaps that mythical Somebody could expand it into a
>proper description of symbol exports in general...:)

As I said in the other thread, I am happy for it to be moved to a better
location. core-api/ as well as kernel-hacking/ seem to be good
locations.

I could imagine expanding the documentation, but would not like to
commit to it right now. (Even though I feel very encouraged by your talk
in Paris, Jon. Thanks for that!)

Cheers,
Matthias

>
>Thanks,
>
>jon
