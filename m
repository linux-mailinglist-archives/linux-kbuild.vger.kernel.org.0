Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6B0130DFF
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Jan 2020 08:33:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbgAFHdm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Jan 2020 02:33:42 -0500
Received: from mail-pf1-f201.google.com ([209.85.210.201]:47611 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbgAFHdm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jan 2020 02:33:42 -0500
Received: by mail-pf1-f201.google.com with SMTP id e62so12167780pfh.14
        for <linux-kbuild@vger.kernel.org>; Sun, 05 Jan 2020 23:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=DVTZeHtWLkUT+7QBPvqsFl2b+xU5ylPDczrCjXvkopY=;
        b=lWoh7npVSUr5q9DKj2L4rWvZLI3HQOJ8cs+WkhVPBFoFYMpBeAqLnc5yYqH1Pq5Pqm
         iEIKRH3A+hlfCjezT7yiHkLuLV0OeK4oDzecWzdFOtihUCkPd/oAjLNFy9/hr+l3+hAx
         8ip7Q18hSPoJsW/apfj/+cNXdRSUneFDDH0KDH2bj2ZL7A3dk5jvAndqODKX/i1YFGiw
         IEf5+JxC0/T2n/nY+TBXPdrJ5ChV1isRM9cJsAlMACRrAQ0W2CHmsvbgcprjziEQh+WF
         xF24HyyYGTgSpw++bwJarPpsCXeeo/jl6r6v6nZkVR7xpDAWMjuf5YGQn38FakawkUbs
         Uo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=DVTZeHtWLkUT+7QBPvqsFl2b+xU5ylPDczrCjXvkopY=;
        b=O9EkmRz9sUvpzxWCqbcBkl3eknsmVTDmpRtzg7CwGKdglTio+OeQQ3BO6rhc9qQJFv
         +ErMyLvKpcYotgnIUtmSxJl3ymoZqtJyCZNBBydO3NtrR7joChjLbpD/dtMZ23FSuMm4
         znYEFQ6ut1vkzwyaFw5AeV+3jkzgxPI3zOW6m41py3ivUUnAnB+bgY41oExbAvqcmofw
         +Fxv8Vk79Xa33g2ok6hEUPMmnsVYtD62UMzW21a4z5BrrpA5VHfUdWu/7O25WjwWzzMP
         06cHYngr2MwvUUUJT23P6ZzgXdxhmDNLEzvH7ak8tN9/WeNECqJqwoGi626DrRg9lrVS
         hwAg==
X-Gm-Message-State: APjAAAUgMfRUuKuLj/UTZpOFez8fed5+P1CBNKnIusnd5wiYgBLsGL6O
        rQSJ/zL8u6hg7hEIaG6Dwz0QCOoPa+Eq
X-Google-Smtp-Source: APXvYqw9Jv5F45+lib3Sum5lOclNDhenY5qhh9P8ScD9+q9tQaBGrRkGdkh4pWnkdd9UrSnV4Ok99heNZwY7
X-Received: by 2002:a63:a508:: with SMTP id n8mr105954525pgf.278.1578296021583;
 Sun, 05 Jan 2020 23:33:41 -0800 (PST)
Date:   Sun, 05 Jan 2020 23:33:39 -0800
In-Reply-To: <20200104150238.19834-2-masahiroy@kernel.org>
Message-Id: <xr93pnfx6nu4.fsf@gthelen.svl.corp.google.com>
Mime-Version: 1.0
References: <20200104150238.19834-1-masahiroy@kernel.org> <20200104150238.19834-2-masahiroy@kernel.org>
Subject: Re: [PATCH v2 01/13] initramfs: replace klibcdirs in Makefile with FORCE
From:   Greg Thelen <gthelen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> wrote:

> 'klibcdirs' was added by commit d39a206bc35d ("kbuild: rebuild initramfs
> if content of initramfs changes"). If this is just a matter of forcing
> execution of the recipe line, we can replace it with FORCE.
>
> I do not understand the purpose of
>
>    $(deps_initramfs): klibcdirs
>
> Remove it.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Greg Thelen <gthelen@google.com>
