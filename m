Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCDBEFE3DC
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2019 18:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727573AbfKORYo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Nov 2019 12:24:44 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40522 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727555AbfKORYo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 12:24:44 -0500
Received: by mail-pg1-f196.google.com with SMTP id 15so6305069pgt.7
        for <linux-kbuild@vger.kernel.org>; Fri, 15 Nov 2019 09:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=7Eg62rE5QP5mVWkEobl5+3oFw1Pb3OmewXJM+IIwSag=;
        b=Jj/Kv1KQeHJCervURI/92GZH526n2xPLAI70jj9x3n+TVTuxnjX3P7h27TT3zadcQx
         FEeMxCPpHh/94yqDv5Hh4SDgCipB0pwoA9ZBHqtS9JMWUVm2z8bwIxJ4oafqhZaEIYxs
         5hxL8lgbTzzPLTFoGOwfXBOX+DdhaC8FmiL3+qBTSNAGRGGoxDvGIRYDsCsR4uGxoP8q
         sQyv1170WH1b/5c3eeznhPvJlcno+qwUie6wrfVjLB1aWEOU0p7uC4ujSPS/a+vNl8du
         qv09D47N2Qre9HSX8JOZNAzaWjlXezg5kyGPhA+pKmHeR5cGpYT2cyXztrsqLW3H0LRy
         oZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=7Eg62rE5QP5mVWkEobl5+3oFw1Pb3OmewXJM+IIwSag=;
        b=q4PfEG+t/7pLxX2fVGQUIiuH2OgWYewi4/L41RMUJvIPMVTA5SZBRvvfv/tnxximBU
         UtnpWE0mBDBDxVPn8YtaOFm5BgsQW+qAyrB4ZidKMpzzDvMAMLZr0Hm8m01CYLxiVC70
         eF4lYcbEfoxw8aDkZTramWlRLkPtPoD7AKAloryazyJrcK9NOjEFxHYx297AzNjkCIy0
         qrrMxNorP1Vnf/MiKWgkJiQRwUZ7QDG3eSLtsOBNcX+WJyJdpr2jo9XPbbeeBCmxEVQU
         97ucZzfP5zTlRWPBmv743lRrtkE0PgHrcy7mjLoBhfFDsZK8Ma31j9qEGTO4z1bMkPPo
         PCcA==
X-Gm-Message-State: APjAAAWImqg7ClvAQTjnfomqLK1VaFnWLMFYbbycdiLF/pLMVKvLjaAe
        ftVh8oOwYFIbacby7kMjMUN5mA==
X-Google-Smtp-Source: APXvYqy0g+SLctG6bBTKCqBMkm+DFPpOjxR0CjcbffcOwdXHVcj3/9JYAL2Kd7bdM+i0rrGaWIQdsw==
X-Received: by 2002:a63:5163:: with SMTP id r35mr5652026pgl.201.1573838683002;
        Fri, 15 Nov 2019 09:24:43 -0800 (PST)
Received: from [192.168.0.177] (c-67-180-165-146.hsd1.ca.comcast.net. [67.180.165.146])
        by smtp.gmail.com with ESMTPSA id 23sm10345379pgw.8.2019.11.15.09.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2019 09:24:41 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH v3 6/7] scripts/sorttable: Add ORC unwind tables sort concurrently
Date:   Fri, 15 Nov 2019 09:24:07 -0800
Message-Id: <A4F85A0C-C8A8-4226-A334-276F9D0C2679@amacapital.net>
References: <9594afbc-52bc-5ae7-4a19-8fc4b36a1abd@linux.alibaba.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
In-Reply-To: <9594afbc-52bc-5ae7-4a19-8fc4b36a1abd@linux.alibaba.com>
To:     Shile Zhang <shile.zhang@linux.alibaba.com>
X-Mailer: iPhone Mail (17A878)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


> On Nov 15, 2019, at 1:43 AM, Shile Zhang <shile.zhang@linux.alibaba.com> w=
rote:
>=20
> =EF=BB=BF
>=20
>> On 2019/11/15 17:07, Peter Zijlstra wrote:
>>> On Fri, Nov 15, 2019 at 02:47:49PM +0800, Shile Zhang wrote:
>>>=20
>>> +#if defined(SORTTABLE_64) && defined(UNWINDER_ORC_ENABLED)
>>> +/* ORC unwinder only support X86_64 */
>>> +#include <errno.h>
>>> +#include <pthread.h>
>>> +#include <linux/types.h>
>>> +
>>> +#define ORC_REG_UNDEFINED    0
>>> +#define ERRSTRING_MAXSZ        256
>>> +
>>> +struct orc_entry {
>>> +    s16        sp_offset;
>>> +    s16        bp_offset;
>>> +    unsigned    sp_reg:4;
>>> +    unsigned    bp_reg:4;
>>> +    unsigned    type:2;
>>> +    unsigned    end:1;
>>> +} __attribute__((packed));
>>> +
>>> +struct orctable_info {
>>> +    size_t    orc_size;
>>> +    size_t    orc_ip_size;
>>> +} orctable;
>> There's ./arch/x86/include/asm/orc_types.h for this. Please don't
>> duplicate. objtool uses that same header.
> Good catch! Thanks for your kindly reminder! I'll remove it.
>>> +/**
>>> + * sort - sort an array of elements
>>> + * @base: pointer to data to sort
>>> + * @num: number of elements
>>> + * @size: size of each element
>>> + * @cmp_func: pointer to comparison function
>>> + * @swap_func: pointer to swap function
>>> + *
>>> + * This function does a heapsort on the given array. You may provide a
>>> + * swap_func function optimized to your element type.
>>> + *
>>> + * Sorting time is O(n log n) both on average and worst-case. While
>>> + * qsort is about 20% faster on average, it suffers from exploitable
>>> + * O(n*n) worst-case behavior and extra memory requirements that make
>>> + * it less suitable for kernel use.
>>> + *
>>> + * This code token out of /lib/sort.c.
>>> + */
>>> +static void sort(void *base, size_t num, size_t size,
>>> +      int (*cmp_func)(const void *, const void *),
>>> +      void (*swap_func)(void *, void *, int size))
>>> +{
>>> +    /* pre-scale counters for performance */
>>> +    int i =3D (num/2 - 1) * size, n =3D num * size, c, r;
>>> +
>>> +    /* heapify */
>>> +    for ( ; i >=3D 0; i -=3D size) {
>>> +        for (r =3D i; r * 2 + size < n; r  =3D c) {
>>> +            c =3D r * 2 + size;
>>> +            if (c < n - size &&
>>> +                    cmp_func(base + c, base + c + size) < 0)
>>> +                c +=3D size;
>>> +            if (cmp_func(base + r, base + c) >=3D 0)
>>> +                break;
>>> +            swap_func(base + r, base + c, size);
>>> +        }
>>> +    }
>>> +
>>> +    /* sort */
>>> +    for (i =3D n - size; i > 0; i -=3D size) {
>>> +        swap_func(base, base + i, size);
>>> +        for (r =3D 0; r * 2 + size < i; r =3D c) {
>>> +            c =3D r * 2 + size;
>>> +            if (c < i - size &&
>>> +                    cmp_func(base + c, base + c + size) < 0)
>>> +                c +=3D size;
>>> +            if (cmp_func(base + r, base + c) >=3D 0)
>>> +                break;
>>> +            swap_func(base + r, base + c, size);
>>> +        }
>>> +    }
>>> +}
>> Do we really need to copy the heapsort implementation? That is, why not
>> use libc's qsort() ? This is userspace after all.
>=20
> Yes, I think qsort is better choice than copy-paste here. But qsort does n=
ot support customized swap func, which is needed for ORC unwind swap two tab=
les together.
> I think it's hard to do with qsort, so I used sort same with original orc u=
nwind table sort.

One solution is to make an array of indices 0, 1, 2, etc, and sort that usin=
g a comparison function that compares i,j by actually comparing source[i], s=
ource[j]. (Or use pointers, but indices are probably faster on a 64-bit mach=
ine if you can use 32-bit indices.) Then, after sorting, permute the origina=
l array using the now-sorted indices. In the case where swapping is expensiv=
e, this is actually faster, since it does exactly n moves instead of O(n log=
 n).

>=20
