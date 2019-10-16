Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C182DA1A1
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2019 00:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388273AbfJPWkZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Oct 2019 18:40:25 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:47085 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726743AbfJPWkY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Oct 2019 18:40:24 -0400
Received: by mail-lj1-f196.google.com with SMTP id d1so361793ljl.13
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Oct 2019 15:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=04dJb9Nazr1VJFQ3H66lxKHMdWvTkJpJ9XeZFuHXJpY=;
        b=Y6FXKxmvNk+SLSy8K1d8iyVTicj84WbDRknyfjwv/0dEjng3n+gui83MkLy/POww6I
         IMiehB/IGPDe1KtWH9SiVdUWEkMntj3gNmyrct47Rf3lWJ0XoTln8pEYhIce5pbKMgAP
         cQwkdbd4zrNR84FnQGKl1y+P6KVdwD+HPFdns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=04dJb9Nazr1VJFQ3H66lxKHMdWvTkJpJ9XeZFuHXJpY=;
        b=Lh2UHgN3h03P4HRI2lXGFGWgW+Jbwnpgt7EwaVI4Mo+Q+ibQBfFhr4B8eRR+UxKHtj
         LHeTi3CYELfT8Byu0OXH66nDQKEuqgqqT3HR+7fJGEQftut78UQN0/1hkxxs4OZppi2Q
         maorePvq71vp+Ad3qIccCv5MRWRzezEMgh6iVii1BgGM8PP/LvZBj/8GBg5WVi/erTFv
         I0P6tVUvadGVVw1YlTGboLE3tbSh+Gmbnl+3ir3U1Kl4kRk2ve6P5RQRviMrWvFG+vr0
         /m7RwTTZgrGn/BCUH635XZ7J9qAUT7PJqY/Kk8l5Eyt+HdycYrqmCTknpWJgfEiUMCBG
         ZkVw==
X-Gm-Message-State: APjAAAXWoJxg8/Jh9Z720kjW93O5sJNtgakWNxnfhKlGAsgS0QY8oITr
        zXgwXVq0cL8iuU/hPkr3R1bkTmEHByk=
X-Google-Smtp-Source: APXvYqxH1CrJ9zY1Md2mQ59uIQoe4iUWJJBN4NmxFXltPb6fnu+UZ1a/Pk1kUl/+6rdHlKaGTZCQJw==
X-Received: by 2002:a2e:8084:: with SMTP id i4mr288064ljg.137.1571265622789;
        Wed, 16 Oct 2019 15:40:22 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id t6sm110747ljd.102.2019.10.16.15.40.20
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2019 15:40:20 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id d1so361707ljl.13
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Oct 2019 15:40:20 -0700 (PDT)
X-Received: by 2002:a2e:2b91:: with SMTP id r17mr311891ljr.1.1571265619954;
 Wed, 16 Oct 2019 15:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <57fd50dd./gNBvRBYvu+kYV+l%akpm@linux-foundation.org>
 <CA+55aFxr2uZADh--vtLYXjcLjNGO5t4jmTWEVZWbRuaJwiocug@mail.gmail.com>
 <CA+55aFxQRf+U0z6mrAd5QQLWgB2A_mRjY7g9vpZHCSuyjrdhxQ@mail.gmail.com> <CAHk-=wgr12JkKmRd21qh-se-_Gs69kbPgR9x4C+Es-yJV2GLkA@mail.gmail.com>
In-Reply-To: <CAHk-=wgr12JkKmRd21qh-se-_Gs69kbPgR9x4C+Es-yJV2GLkA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 16 Oct 2019 15:40:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=whaSMp_MOKgAa=AwLDAY0Rtjdrw-AFKuLXbFsTJSevosA@mail.gmail.com>
Message-ID: <CAHk-=whaSMp_MOKgAa=AwLDAY0Rtjdrw-AFKuLXbFsTJSevosA@mail.gmail.com>
Subject: Re: [patch 014/102] llist: introduce llist_entry_safe()
To:     Andrew Morton <akpm@linux-foundation.org>,
        "Kirill A. Shutemov" <kirill@shutemov.name>,
        Andrew Pinski <apinski@cavium.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     mm-commits@vger.kernel.org,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Eric Dumazet <edumazet@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Ingo Molnar <mingo@elte.hu>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 16, 2019 at 3:23 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I only tested gnu99 - which is sufficient for the above - and didn't
> see if gnu11 ends up causing more issues..

I see at least no obvious issues with gnu11, so if this works for
other architectures too, we should just switch over.

              Linus
