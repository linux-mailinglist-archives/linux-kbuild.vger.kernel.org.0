Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1FFBED3AA
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Nov 2019 16:11:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727682AbfKCPL4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 3 Nov 2019 10:11:56 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20287 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727624AbfKCPLz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 3 Nov 2019 10:11:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1572793914;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pKeQqHTNm2rKMXKnKYnKXv0/Zvs8TwJgyMSIjxTYZk4=;
        b=W2yDnmY7szGa8v+H1u8PGwx/uOGKoOt4nqr3IEj6GDPBrhvzEFtwx+B8csYIa+dAyAkOY3
        Il7bUQzGAhNZCOCfcBWjxhwbvgTIGkAPXhZysfjsLWexuwO7sUUDnHFbn+kYDCo3P1JZ0h
        A16vLBlIV/vrwltAF0Cbkp2qkrQVF+A=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28--XQ3AV6HPye9F6c9qex_5w-1; Sun, 03 Nov 2019 10:11:53 -0500
Received: by mail-lf1-f69.google.com with SMTP id x21so2710009lff.13
        for <linux-kbuild@vger.kernel.org>; Sun, 03 Nov 2019 07:11:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hYLWafxRH7qP066b4Mp7DMWQe6c3nTG9BEtUCE6Dw9w=;
        b=VjAOwnmrVFAJThCgiDrM4DsTyrnHY7Tt1bCymAcPc+HZ+d5QEdGht77qkXLveV481o
         WNFNF7BRh2my7JlhRK9kFMbc+citN+lwSfqVFXr8jnydtPk95KcSX1mYZxIMfLLh5pDT
         knej+wRCmbT0QlmxvNt2cu/A4DIZve7HpZitJwG80xPB6RtQta5XcevX4/7dnqOTyo+b
         P6hk7TsBEFNWH0LGF+XxQ3WBR7lBTYz+0AjBMD0FehdP0u7GN6wmjLcuOnuyliz+S/ZW
         CJ/1t/WPPZpgHI7EmF3ebIB8j+TtHJECvW2DlMDjTV52Mcr1tLEIPtgNQpxI/wR3au2v
         RnSQ==
X-Gm-Message-State: APjAAAXOssdU99TkI4YgpE2VFasAK7T/+JsiSEAlEf0IMav4qbIhajGY
        ex9dKTpJwTP5nJCicYYdfrj24VMKy+3hW1rqCqxw7Wrc/4sDDpcCxqTjLEF8SdmgiY+EOh+kfuX
        r2G78N9oDpJSd9bkXXmt0ioe3Ex1OilZEqv1AHvKb
X-Received: by 2002:a2e:85c3:: with SMTP id h3mr2400845ljj.122.1572793911421;
        Sun, 03 Nov 2019 07:11:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqxJINflfnixbbcQ99J2apjempSeXAlWGD/Q7p/bS1pLZID2PiNqKOal81VXjgLT7btCyZkPFqFUHydQLoy/tN4=
X-Received: by 2002:a2e:85c3:: with SMTP id h3mr2400839ljj.122.1572793911266;
 Sun, 03 Nov 2019 07:11:51 -0800 (PST)
MIME-Version: 1.0
References: <20191009151019.13488-1-mcroce@redhat.com>
In-Reply-To: <20191009151019.13488-1-mcroce@redhat.com>
From:   Matteo Croce <mcroce@redhat.com>
Date:   Sun, 3 Nov 2019 16:11:15 +0100
Message-ID: <CAGnkfhzj-X-R_4toZdJ2eBfhpq1t0dHYq=P+0w-VD30ZAh59qQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add make dir-pkg build option
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        LKML <linux-kernel@vger.kernel.org>
X-MC-Unique: -XQ3AV6HPye9F6c9qex_5w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 9, 2019 at 5:10 PM Matteo Croce <mcroce@redhat.com> wrote:
>
> Add a 'dir-pkg' target which just creates the same directory structures
> as in tar-pkg, but doesn't package anything.
> Useful when the user wants to copy the kernel tree on a machine using
> ssh, rsync or whatever.
>
> Signed-off-by: Matteo Croce <mcroce@redhat.com>

Hi,

any comment on this?

--=20
Matteo Croce
per aspera ad upstream

