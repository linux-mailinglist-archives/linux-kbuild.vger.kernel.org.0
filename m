Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 080FA20F2E
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 May 2019 21:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbfEPTYs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 May 2019 15:24:48 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40435 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbfEPTYs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 May 2019 15:24:48 -0400
Received: by mail-lf1-f67.google.com with SMTP id h13so3519864lfc.7
        for <linux-kbuild@vger.kernel.org>; Thu, 16 May 2019 12:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iLTn+QvfYrIHezT5N6xFxmxlFlQhvc8iiUJMiD7mN8c=;
        b=M7LEefcZ+K0Q9FEwRe9DRbHecU1l0hRfuyiAiZxZ8fodqIB3Wjf9CTW1g493djxaL0
         Xx2Sdwfp3A3A963CQcYZTMWUTAQvgl1j+ah+Y70kkDZ6/qh5evZ61ixtcPfA1xWJknUK
         WTQLlAK5WdB8BH0wO8BMC59EIqlKiatRteL4TC+j0XPqjmpBB06yDTuwVTvYRnj9gMS2
         oASTe2qdFuOMaEknb1kHl3lnUXd7ab9rHjElz0fRf5rmELfW0JtHqNJRhmhiTPa8kEYd
         WOmFQ7aLUGcAGbUWnOcnJOtuMjcmPa9k4rOHF4pFAO4j69ELG0w1t1SwuDek8uJ8+vfb
         NuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iLTn+QvfYrIHezT5N6xFxmxlFlQhvc8iiUJMiD7mN8c=;
        b=nmYeMAOltuM3FtWcY3qSO9pHlHDIMiFJ1CjNs1sD0kSEtUc/+k1F7p2BxHpiAlBsGa
         lfOMKR/h9vbKJPApuJgV/Bzn5Ipit09OdoRKqJqlLa6JRragIj68tMYAN8VfYf5kk/Ne
         QJTyldqXM9q/LQLar+LPMCBVrPZB5gYoNS940ngMAzNpoTVKG8Ulk6L14CMVzU/L2Poc
         vdbGwbxtZhuhvYqQWJQLop/RmDV72eCMbFQ3yotR0dEofHz9nUfo/dKgMJqhfS5/m3IN
         ecqFmai/kTL1x8ZVfLaAYFN13+uhDQ62NCPsYmnhU2f9boHspa4Qc1xFKRtW82d9G6Hf
         jUdQ==
X-Gm-Message-State: APjAAAXG3G3RDllPo8L6boY6gt9bHJuNDI1HDrasvsqbrhyqZ3pIzOvd
        HEd8kHaYOnq1wI/tC5aRKe9VU+J//K33fVV5cPUU88/y
X-Google-Smtp-Source: APXvYqy0yuaLYBlkJ+/H3AKWHA8RV/i+y9pFD7dJoXgkOy394qTdKjwf8pFakyxJj3RJmEhsvMihECjdxj4QxPXXWwY=
X-Received: by 2002:ac2:518b:: with SMTP id u11mr24535904lfi.30.1558034686718;
 Thu, 16 May 2019 12:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <CABWYdi06NUOWRLingNuybgZZsTZPjhmsOx-9oCGK94qZGYbzcw@mail.gmail.com>
In-Reply-To: <CABWYdi06NUOWRLingNuybgZZsTZPjhmsOx-9oCGK94qZGYbzcw@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 16 May 2019 21:24:35 +0200
Message-ID: <CANiq72kvpiC-i53AXM-YsCUvWroHQemmqxsXjnB330ZEeHahUg@mail.gmail.com>
Subject: Re: Linux 4.19 and GCC 9
To:     Ivan Babrou <ivan@cloudflare.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        kernel-team <kernel-team@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Ivan,

On Wed, May 15, 2019 at 8:55 PM Ivan Babrou <ivan@cloudflare.com> wrote:
>
> Hey,
>
> It looks like it's not possible to build Linux 4.19.43 (latest LTS as
> of today) with GCC 9.1 (latest stable GCC). From what I see, some
> support for GCC 9 was added by Miguel (cc'd) in 4.20, but it was never
> backported into 4.19.

I just compiled 4.19.43 allmodconfig with GCC 9.1.1 and it succeeded
(even if it gives a lot of warnings from objtool and
-Wmissing-attributes).

Which errors are you seeing? On which config?

Cheers,
Miguel
