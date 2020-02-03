Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F864150EA4
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Feb 2020 18:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728508AbgBCRd3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Feb 2020 12:33:29 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39188 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbgBCRd2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Feb 2020 12:33:28 -0500
Received: by mail-lj1-f195.google.com with SMTP id o15so9990040ljg.6
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Feb 2020 09:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4hbE/x+sKgUAgdZy5iD1MgArPOja0ET3H9jzYkhb1ns=;
        b=WYFHmu8BI34dQPDYIAU9HVfivXkiWKo8NGvuEy7B6TsaQmEE8aTI4n0VwoxW+lgt2V
         kkDCpnuh98u9bEorsiDtOuKYAOPlNmacBmM21claXHAv5AtJRqeQyw4gS4hRyWLexsc5
         mW7oNEJYTcmOIHR+e6ixQIiRFZbZEzwujp5lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4hbE/x+sKgUAgdZy5iD1MgArPOja0ET3H9jzYkhb1ns=;
        b=cpWH+RM58EbmaKuyt3PTl8Pnkm1vCMRWsii0tXNoeQCxMZOHkp+c45c+/xvopMs0Xj
         +cz3qV5G0Htj2wZ5+Z2ZT/t8Vp33/5zmsWWzE7LSa4f2J3k3bhQ6OxLzc21obWe/grVF
         9/1OIS03Y2tsVs+P9WgtfsmNqTH/pgLbYJVP1BhTQjPF8sHeXcWurGBXL1sExZlFFBUG
         7klx9n8dxtBoagqpgMyNcVlRYATz9AnuIRj9tToHgP6TNWbIj2yDqYqLhmSOFgY6kfiR
         q4R8+BeU9KWouxNEVW+RJtxsqeaonJznPRrtdSBkO6ileVg7eiZghX0L63wIzej9bQ+I
         Ad+g==
X-Gm-Message-State: APjAAAWXhGuqjXtejf71iJ8l70FgpYi6etsGtGMsxU8b1BWOVgQ/LjUz
        7Xy+HDQvf018n5IKF+X+JtafRWM7aPmugA==
X-Google-Smtp-Source: APXvYqzU5EfclhFpaN1fH3hKK1l7RiJUsWbxowUMF5IJw28EfmGxFR3SVday2uBQzQ1L7w/DkW1pMQ==
X-Received: by 2002:a2e:9e16:: with SMTP id e22mr15305646ljk.220.1580751204465;
        Mon, 03 Feb 2020 09:33:24 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id m8sm9376342lfp.4.2020.02.03.09.33.23
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2020 09:33:23 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id 9so10266582lfq.10
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Feb 2020 09:33:23 -0800 (PST)
X-Received: by 2002:a19:c82:: with SMTP id 124mr12455037lfm.152.1580751202962;
 Mon, 03 Feb 2020 09:33:22 -0800 (PST)
MIME-Version: 1.0
References: <20200203164708.17478-1-masahiroy@kernel.org>
In-Reply-To: <20200203164708.17478-1-masahiroy@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 3 Feb 2020 17:33:06 +0000
X-Gmail-Original-Message-ID: <CAHk-=whHRjzeTRsPta3VY3pnT_NRPXgCqPgmm=midXevHjGZEg@mail.gmail.com>
Message-ID: <CAHk-=whHRjzeTRsPta3VY3pnT_NRPXgCqPgmm=midXevHjGZEg@mail.gmail.com>
Subject: Re: [PATCH] initramfs: do not show compression mode choice if
 INITRAMFS_SOURCE is empty
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Thelen <gthelen@google.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Feb 3, 2020 at 4:47 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Will you directly pick up this if you are OK with it?

Done. Thanks,

              Linus
