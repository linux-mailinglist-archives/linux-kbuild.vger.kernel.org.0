Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3796A88BF5
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2019 17:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbfHJPoo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Aug 2019 11:44:44 -0400
Received: from mail-ua1-f54.google.com ([209.85.222.54]:39201 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbfHJPoo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Aug 2019 11:44:44 -0400
Received: by mail-ua1-f54.google.com with SMTP id j8so38805692uan.6
        for <linux-kbuild@vger.kernel.org>; Sat, 10 Aug 2019 08:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hC5QZCKPCQqDBMRmNsWt8EuD5BPVmGXQoP/e800tTKI=;
        b=CtEDL7Z6gHmBwt8TwKloXUMYjuisJII7UFOmilqyHa1dNYApODbW0etGxyVHdgcJbA
         xTCjrkuqt+/eK37x8g9P0E3bJkN0D4BtHPUTlqIyoOTYmiZecVYWUB+oeSREZ+WZcz/8
         N9Kloc1PNP18XkaLhiyAWalrFDYEF4LfB1WTB2FgKBqB9lcdLRuM97sK3jps8mLaME5m
         vIoeZolcCirlpFj53xnHvfIOy/tZjI1PnNbpJu574HHhVpR+ccjFSuhisReHOMmqzRVC
         bjTjl6zmVWRqvzbmnZ1frPYYUn9ZApoMw8nPVLDiGIj8oN4D9Jin/OH7lb7HcmLeHtW8
         4aSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hC5QZCKPCQqDBMRmNsWt8EuD5BPVmGXQoP/e800tTKI=;
        b=UgKLOGU+pZa5wlrk2Ohpr5QFpTlygPwBD5APUSI+EydvchIxB2UwstWroP4OgvNvIC
         ySJKLjZwNVVPHo793I9G3gKfBJFR55DtQ50u5aqqhbZw5AV4QIyFe2u/gYEf0ISXQV8F
         tSUFG79h1xd7p+YxDPhVjyzlSC7c7R9LyJsEV4Qb89XkWsX4VvyJ6lCr0xFZaqsk49JD
         EZQ5afWrlvUCVE1eH5KAQXDpRh3jqBEHqiOsBkgfeZLCTCrkSYDW+1VWy5IJecFLHxp+
         nzyjifr+yago7EwkIeV8B1NvIYz2C+r1I5VtMaXkvIApn3tYNIsiqvmpYytuMzA+7HFj
         2Xgw==
X-Gm-Message-State: APjAAAWSQZpJw3B/kOBE38mP7V9KOyjdwUvxGbIa5iTgmfi6/paozLw1
        Cp8ePwxCzeB33t0VvAs4HC+WL4x0erv2ptfjN2/jwM7l
X-Google-Smtp-Source: APXvYqzMNyqS4Kz8uG9OFgRbJxSPclCpl5XrHDLVnjCBqzqCjDud/r4PYbe6R8n1IwclwAwKIBQmwbN9xiU0Iw2DqHE=
X-Received: by 2002:ab0:3391:: with SMTP id y17mr15801708uap.139.1565451883444;
 Sat, 10 Aug 2019 08:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <CALYGOBV9FERiui6mJDmQyAjaNASAOQ5z1k-6nCHQVB+c4XxmSw@mail.gmail.com>
 <CAK7LNAQSFdSZ5OctMkhXRmmXrq4S0cJ4Xy3MOd9iLF-Cs_VQMw@mail.gmail.com>
 <CALYGOBVauUutGGc8HNvLwue58AJp5DxOuM8b30XDgfbqJkLo1w@mail.gmail.com> <50091cb8-37ee-4234-9fb8-47d148e36ed3@metux.net>
In-Reply-To: <50091cb8-37ee-4234-9fb8-47d148e36ed3@metux.net>
From:   Thomas Albers <thomas.gameiro@googlemail.com>
Date:   Sat, 10 Aug 2019 10:44:32 -0500
Message-ID: <CALYGOBXEZOk3k+tWCLjRhWmJ5e__ZwoAN2PvpOsFB0JYBox42w@mail.gmail.com>
Subject: Re: make_kernelconfig fails in OpenWRT buildroot
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello!

> > Somehow, kconfig is not linked against libtinfow.
>
> can you make sure you don't have any ncurses pieces in your sysroot and
> retry ?

No ncurses in sysroot. The kconfig script worked when the sysroot's
pkg-config was disabled. Right now I think there are issues with the
way OpenWRT uses pkg-config.

Regards,
Thomas
