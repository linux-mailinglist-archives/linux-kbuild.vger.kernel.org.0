Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 687D8152681
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Feb 2020 07:56:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbgBEG4M (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 5 Feb 2020 01:56:12 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46455 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgBEG4M (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Feb 2020 01:56:12 -0500
Received: by mail-lj1-f196.google.com with SMTP id x14so1107785ljd.13
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Feb 2020 22:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eaeNjDMY0uYjijMDWYXE4Y/guSYZA/DvST2lOWVAhH4=;
        b=FnqBmnHap+h8ESz0fHD6GyHA9tn1+8OyNZQuWUeufudz1T1B7DW1+Vb168niiLDgx2
         qdR7lMITxlOIVHt9z8VGeKxYvVdBD+CdSX9ByYen+1dsT0nx4DxL6yNUWPckPVVilhM+
         N0MkFkDzcb4duPfB1NKud2CJv4ftaSTH/rSaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eaeNjDMY0uYjijMDWYXE4Y/guSYZA/DvST2lOWVAhH4=;
        b=AedEJj90eEtRiCEW1WmpBC702OTZOKldmYjKP7JRXVYvFqpwJZ76u8ggBLDAik776M
         gtpAhuN/iSOM1RP7UiX6e3omwwMaG/7t5eUWu5nmkXRG2LnTqT08dr6/U5uu5RqQtr/r
         Pfg1zd1DsxRoYc771OTl2nmWin1k3DdYkDR90wILOTS3rFSiOtKbUwdYjnsYs9FnyAhe
         Tgba8ThUFs0Pm1ct/57+lSaxRRTxlrBHNxGW7YzYI4nb6NEzlQytoFZngXzfZDVabPer
         uFr03/SUGcMMVMfHdR7xeI9MjWi71EfltQT+6swwrytLTi4wo96zrThiLYWCm4lMuwae
         HHsA==
X-Gm-Message-State: APjAAAVhBaE8M6I5Arongqv3BTmylI2Niun+AJbveUaynZRekZ9GwCYB
        CVwVaQpuhgdNDZwnaHI/SMH796FtNOZs4g==
X-Google-Smtp-Source: APXvYqwlg/IcIMVYxYRu7OX9tGnEMAJ04TinCah204mR1/EbCFx384kyxQCdgYyOw8TASJ95wYbrxQ==
X-Received: by 2002:a05:651c:86:: with SMTP id 6mr20119871ljq.193.1580885769051;
        Tue, 04 Feb 2020 22:56:09 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id r20sm11628685lfi.91.2020.02.04.22.56.08
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 22:56:08 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id n18so1147963ljo.7
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Feb 2020 22:56:08 -0800 (PST)
X-Received: by 2002:a2e:580c:: with SMTP id m12mr19722280ljb.150.1580885767991;
 Tue, 04 Feb 2020 22:56:07 -0800 (PST)
MIME-Version: 1.0
References: <20200205065152.873-1-masahiroy@kernel.org>
In-Reply-To: <20200205065152.873-1-masahiroy@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 5 Feb 2020 06:55:52 +0000
X-Gmail-Original-Message-ID: <CAHk-=wgF6+PqsfQZyTNM9bXK+moUy6kSzbb3ZxxRVo93-_Cc=w@mail.gmail.com>
Message-ID: <CAHk-=wgF6+PqsfQZyTNM9bXK+moUy6kSzbb3ZxxRVo93-_Cc=w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: make multiple directory targets work properly
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 5, 2020 at 6:52 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> If you want to use this patch soon (seems useful since
> you are travelling), please feel free to apply it directly.
>
> If you wait for my next pull request, I will apply it to
> my tree.

I'll wait for the proper channels, I'm heading back home tomorrow
anyway, and it's not been a big problem for me.

Just an oddity I happened to hit because of doing slightly different
things while on the road.

Thanks,
                Linus
