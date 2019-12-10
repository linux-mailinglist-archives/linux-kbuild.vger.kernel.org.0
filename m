Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C818118F3F
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2019 18:46:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727587AbfLJRq3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 10 Dec 2019 12:46:29 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:39654 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727543AbfLJRq3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Dec 2019 12:46:29 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBAHddS0108399;
        Tue, 10 Dec 2019 17:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=xPrwFgUflmQ6jiHgBkznxnTRqUo5GAyZ8gCoMLfbskk=;
 b=HxCqmtnJCqJvr9qrCncC7DlR+kfDCp4nsbitbWvWvlMJAHV1ANs5SRYpLrQrdGUr1tli
 MglPRLT4pzvFRJoGj0Zxndcq1JCI2fYT8M4m87tcNg8UJakaVAyb1RBMdqxa+Ijwwpzp
 8ARE/vXfzLKFiHxV4DWzgJlWxMjNo/XBkJJVbLjU4ziCgHnNpoQYHilnKKk5wipGBMVi
 C/XZNmx8UmvzRs1v9ZKUVCQ7d/c/G84MKEZqgWDPjbXtMqeDseawKXWj3xMa4NAChiii
 AfuYrixCMhJsXYnwe5IBOeLWK2JZ6Jca1HmbOe13i5dyrsKHYw/8SB3G64Zq5/6geaJl TA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 2wrw4n4m64-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 10 Dec 2019 17:45:41 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBAHhxKe013620;
        Tue, 10 Dec 2019 17:45:40 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 2wt13dfe2j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 10 Dec 2019 17:45:40 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xBAHjcEQ009938;
        Tue, 10 Dec 2019 17:45:38 GMT
Received: from [10.211.14.86] (/10.211.14.86)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 10 Dec 2019 09:45:37 -0800
Subject: Re: [PATCH v3] kallsyms: add names of built-in modules
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        Jessica Yu <jeyu@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Song Liu <songliubraving@fb.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Keller, Jacob E" <jacob.e.keller@intel.com>,
        Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>
References: <20191119224225.2438-1-eugene.loh@oracle.com>
 <20191120045938.2155-1-eugene.loh@oracle.com>
 <CAK7LNASv4BkjHYaUXWEjeizHF6UckSef72y=X1VV2zEAOn1XdA@mail.gmail.com>
From:   Eugene Loh <eugene.loh@oracle.com>
Message-ID: <7e0f4a74-63c5-ad62-c619-c6277c4bc791@oracle.com>
Date:   Tue, 10 Dec 2019 09:45:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNASv4BkjHYaUXWEjeizHF6UckSef72y=X1VV2zEAOn1XdA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9467 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912100150
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9467 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912100150
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Thank you for the careful review.  Sorry for the delayed response.  I 
will post a v4 momentarily.  Further comments below.

On 11/22/2019 02:00 AM, Masahiro Yamada wrote:

> On Wed, Nov 20, 2019 at 2:02 PM <eugene.loh@oracle.com> wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> /proc/kallsyms is very useful for tracers and other tools that need
>> to map kernel symbols to addresses.
>>
>> It would be useful if there were a mapping between kernel symbol and
>> module name that only changed when the kernel source code is changed.
> Unfortunately, this is not necessarily true.
> Some objects could be linked into multiple modules.

Good point but, as Nick pointed out, at least we can solve the common 
case.  I have added a remark to that effect to the commit message.

>>   .gitignore                  |   1 +
>>   Documentation/dontdiff      |   1 +
>>   Makefile                    |  41 ++-
>>   kernel/kallsyms.c           |  12 +-
>>   scripts/Makefile.modbuiltin |  20 +-
>>   scripts/kallsyms.c          | 515 +++++++++++++++++++++++++++++++++++-
>>   scripts/link-vmlinux.sh     |  17 ++
>>   scripts/namespace.pl        |   5 +
>>   8 files changed, 589 insertions(+), 23 deletions(-)
> This diff-stat is unfortunate.
> scripts/kallsyms.c increased 65% for parsing
> .tmp_vmlinux.ranges and modules_think.builtin
>
> I tend to suspect the design mistake...

I have cleaned the changes up some and moved one portion, that can be 
used for other purposes, into a separate file.  So the delta on 
scripts/kallsyms.c has been decreased some.

>> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
>> @@ -69,10 +76,116 @@ static unsigned char best_table[256][2];
>> +static struct obj2mod_elem *obj2mod[OBJ2MOD_N];
>> +
>> +static void obj2mod_init(void)
>> +{
>> +       memset(obj2mod, 0, sizeof(obj2mod));
>> +}
> Unneeded.
>
> The .bss section is automatically zero-cleared by
> operating system.  obj2mod is already zero-filled.

Thanks.  Change made.

>> +static void obj2mod_put(char *obj, int mod)
> you can add 'const' to the 'char *'.
> Same for obj2mod_get().

Thanks.  Change made.

>> +static int addrmap_compare(const void *keyp, const void *rangep)
>> +{
>> +       unsigned long long addr = *((const unsigned long long *)keyp);
>> +       const struct addrmap_entry *range = (const struct addrmap_entry *)rangep;
> Cast is uneeded since rangep is an opaque pointer.

Thanks.  Change made.

>> @@ -125,6 +252,16 @@ static int read_symbol(FILE *in, struct sym_entry *s)
>> +       /* skip the .init.scratch section */
>> +       if (strcmp(sym, "__init_scratch_end") == 0) {
>> +               init_scratch = 0;
>> +               goto read_another;
>> +       }
>> +       if (strcmp(sym, "__init_scratch_begin") == 0)
>> +               init_scratch = 1;
>> +       if (init_scratch)
>> +               goto read_another;
> How is this hunk related?
> I do not understand it from the commit log.

I removed this section.

>> @@ -154,6 +291,14 @@ static int read_symbol(FILE *in, struct sym_entry *s)
>>          else if (!strncmp(sym, ".LASANPC", 8))
>>                  return -1;
>>
>> +       /* look up the builtin module this is part of (if any) */
>> +       range = (struct addrmap_entry *) bsearch(&s->addr,
> Unneeded cast because bsearch() returns an opaque pointer.

Thanks.  Change made.

>> @@ -454,6 +601,19 @@ static void write_src(void)
>>          for (i = 0; i < 256; i++)
>>                  printf("\t.short\t%d\n", best_idx[i]);
>>          printf("\n");
>> +
>> +       output_label("kallsyms_modules");
>> +       for (i = 0; i < builtin_module_len; i++)
>> +               printf("\t.asciz\t\"%s\"\n", builtin_modules[i]);
>> +       printf("\n");
> Output strings in plain text?
> Did you consider the possibility for compression?

As Nick pointed out, these names (one per module) only add a little 
extra to the size.


>>   int main(int argc, char **argv)
>>   {
>> +       const char *modules_builtin = "modules_thick.builtin";
>> +
>>          if (argc >= 2) {
>>                  int i;
>>                  for (i = 1; i < argc; i++) {
>> -                       if(strcmp(argv[i], "--all-symbols") == 0)
>> +                       if (strcmp(argv[i], "--all-symbols") == 0)
>>                                  all_symbols = 1;
>>                          else if (strcmp(argv[i], "--absolute-percpu") == 0)
>>                                  absolute_percpu = 1;
>>                          else if (strcmp(argv[i], "--base-relative") == 0)
>>                                  base_relative = 1;
>> +                       else if (strncmp(argv[i], "--builtin=", 10) == 0)
>> +                               modules_builtin = &argv[i][10];
>
> ".tmp_vmlinux.ranges" is hard-coded, but
> "modules_think.builtin" can be changed via option. Heh.

Good point.  I removed the unneeded option.

>> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
>> @@ -138,6 +140,19 @@ kallsyms()
>> +       # read the linker map to identify ranges of addresses:
>> +       #   - for each *.o file, report address, size, pathname
>> +       #       - most such lines will have four fields
>> +       #       - but sometimes there is a line break after the first field
>> +       #   - start reading at "Linker script and memory map"
> Searching for "Linker script and memory map" will probably bring
> portability issue.
>
> llvm folks will be unhappy with it.

Actually, LLVM emits the same string.
