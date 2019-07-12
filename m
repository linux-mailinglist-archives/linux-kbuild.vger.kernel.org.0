Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE03A66352
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jul 2019 03:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728497AbfGLBU6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Jul 2019 21:20:58 -0400
Received: from mga14.intel.com ([192.55.52.115]:31380 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726587AbfGLBU5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jul 2019 21:20:57 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Jul 2019 18:20:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,480,1557212400"; 
   d="scan'208";a="168801213"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Jul 2019 18:20:54 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hlkF4-0001WQ-E0; Fri, 12 Jul 2019 09:20:54 +0800
Date:   Fri, 12 Jul 2019 09:20:04 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Iurii Zaikin <yzaikin@google.com>
Cc:     kbuild-all@01.org, linux-kbuild@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Logan Gunthorpe <logang@deltatee.com>
Subject: [kbuild:kunit-v7 66/67] kernel/sysctl-test.c:44:9: sparse: sparse:
 incorrect type in argument 3 (different address spaces)
Message-ID: <201907120915.9DmRjlV1%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kunit-v7
head:   70b8b20a297281be3834f8aac6466ddef75ed8b7
commit: 336af730109f4096b01e450378a64cd7c9fbd1ab [66/67] kernel/sysctl-test: Add null pointer test for sysctl.c:proc_dointvec()
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-rc1-7-g2b96cd8-dirty
        git checkout 336af730109f4096b01e450378a64cd7c9fbd1ab
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> kernel/sysctl-test.c:44:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
>> kernel/sysctl-test.c:44:9: sparse:    expected void [noderef] <asn:1> *
>> kernel/sysctl-test.c:44:9: sparse:    got void *buffer
>> kernel/sysctl-test.c:44:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
>> kernel/sysctl-test.c:44:9: sparse:    expected void [noderef] <asn:1> *
>> kernel/sysctl-test.c:44:9: sparse:    got void *buffer
   kernel/sysctl-test.c:53:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
   kernel/sysctl-test.c:53:9: sparse:    expected void [noderef] <asn:1> *
   kernel/sysctl-test.c:53:9: sparse:    got void *buffer
   kernel/sysctl-test.c:53:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
   kernel/sysctl-test.c:53:9: sparse:    expected void [noderef] <asn:1> *
   kernel/sysctl-test.c:53:9: sparse:    got void *buffer
   kernel/sysctl-test.c:89:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
   kernel/sysctl-test.c:89:9: sparse:    expected void [noderef] <asn:1> *
   kernel/sysctl-test.c:89:9: sparse:    got void *buffer
   kernel/sysctl-test.c:89:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
   kernel/sysctl-test.c:89:9: sparse:    expected void [noderef] <asn:1> *
   kernel/sysctl-test.c:89:9: sparse:    got void *buffer
   kernel/sysctl-test.c:98:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
   kernel/sysctl-test.c:98:9: sparse:    expected void [noderef] <asn:1> *
   kernel/sysctl-test.c:98:9: sparse:    got void *buffer
   kernel/sysctl-test.c:98:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
   kernel/sysctl-test.c:98:9: sparse:    expected void [noderef] <asn:1> *
   kernel/sysctl-test.c:98:9: sparse:    got void *buffer
   kernel/sysctl-test.c:129:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
   kernel/sysctl-test.c:129:9: sparse:    expected void [noderef] <asn:1> *
   kernel/sysctl-test.c:129:9: sparse:    got void *buffer
   kernel/sysctl-test.c:129:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
   kernel/sysctl-test.c:129:9: sparse:    expected void [noderef] <asn:1> *
   kernel/sysctl-test.c:129:9: sparse:    got void *buffer
   kernel/sysctl-test.c:133:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
   kernel/sysctl-test.c:133:9: sparse:    expected void [noderef] <asn:1> *
   kernel/sysctl-test.c:133:9: sparse:    got void *buffer
   kernel/sysctl-test.c:133:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
   kernel/sysctl-test.c:133:9: sparse:    expected void [noderef] <asn:1> *
   kernel/sysctl-test.c:133:9: sparse:    got void *buffer
   kernel/sysctl-test.c:167:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
   kernel/sysctl-test.c:167:9: sparse:    expected void [noderef] <asn:1> *
   kernel/sysctl-test.c:167:9: sparse:    got void *buffer
   kernel/sysctl-test.c:167:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
   kernel/sysctl-test.c:167:9: sparse:    expected void [noderef] <asn:1> *
   kernel/sysctl-test.c:167:9: sparse:    got void *buffer
   kernel/sysctl-test.c:196:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
   kernel/sysctl-test.c:196:9: sparse:    expected void [noderef] <asn:1> *
>> kernel/sysctl-test.c:196:9: sparse:    got char *
   kernel/sysctl-test.c:196:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
   kernel/sysctl-test.c:196:9: sparse:    expected void [noderef] <asn:1> *
>> kernel/sysctl-test.c:196:9: sparse:    got char *
   kernel/sysctl-test.c:225:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
   kernel/sysctl-test.c:225:9: sparse:    expected void [noderef] <asn:1> *
   kernel/sysctl-test.c:225:9: sparse:    got char *
   kernel/sysctl-test.c:225:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
   kernel/sysctl-test.c:225:9: sparse:    expected void [noderef] <asn:1> *
   kernel/sysctl-test.c:225:9: sparse:    got char *
   kernel/sysctl-test.c:252:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
   kernel/sysctl-test.c:252:9: sparse:    expected void [noderef] <asn:1> *
   kernel/sysctl-test.c:252:9: sparse:    got char *
   kernel/sysctl-test.c:252:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
   kernel/sysctl-test.c:252:9: sparse:    expected void [noderef] <asn:1> *
   kernel/sysctl-test.c:252:9: sparse:    got char *
   kernel/sysctl-test.c:278:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
   kernel/sysctl-test.c:278:9: sparse:    expected void [noderef] <asn:1> *
   kernel/sysctl-test.c:278:9: sparse:    got char *
   kernel/sysctl-test.c:278:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
   kernel/sysctl-test.c:278:9: sparse:    expected void [noderef] <asn:1> *
   kernel/sysctl-test.c:278:9: sparse:    got char *
   kernel/sysctl-test.c:317:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
   kernel/sysctl-test.c:317:9: sparse:    expected void [noderef] <asn:1> *
   kernel/sysctl-test.c:317:9: sparse:    got char *
   kernel/sysctl-test.c:317:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
   kernel/sysctl-test.c:317:9: sparse:    expected void [noderef] <asn:1> *
   kernel/sysctl-test.c:317:9: sparse:    got char *
   kernel/sysctl-test.c:349:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
   kernel/sysctl-test.c:349:9: sparse:    expected void [noderef] <asn:1> *
   kernel/sysctl-test.c:349:9: sparse:    got char *
   kernel/sysctl-test.c:349:9: sparse: sparse: incorrect type in argument 3 (different address spaces) @@    expected void [noderef] <asn:1> * @@    got n:1> * @@
   kernel/sysctl-test.c:349:9: sparse:    expected void [noderef] <asn:1> *
   kernel/sysctl-test.c:349:9: sparse:    got char *

vim +44 kernel/sysctl-test.c

    14	
    15	/*
    16	 * Test that proc_dointvec will not try to use a NULL .data field even when the
    17	 * length is non-zero.
    18	 */
    19	static void sysctl_test_api_dointvec_null_tbl_data(struct kunit *test)
    20	{
    21		struct ctl_table null_data_table = {
    22			.procname = "foo",
    23			/*
    24			 * Here we are testing that proc_dointvec behaves correctly when
    25			 * we give it a NULL .data field. Normally this would point to a
    26			 * piece of memory where the value would be stored.
    27			 */
    28			.data		= NULL,
    29			.maxlen		= sizeof(int),
    30			.mode		= 0644,
    31			.proc_handler	= proc_dointvec,
    32			.extra1		= &i_zero,
    33			.extra2         = &i_one_hundred,
    34		};
    35		void *buffer = kunit_kzalloc(test, sizeof(int), GFP_USER);
    36		size_t len;
    37		loff_t pos;
    38	
    39		/*
    40		 * We don't care what the starting length is since proc_dointvec should
    41		 * not try to read because .data is NULL.
    42		 */
    43		len = 1234;
  > 44		KUNIT_EXPECT_EQ(test, 0, proc_dointvec(&null_data_table,
    45						       KUNIT_PROC_READ, buffer, &len,
    46						       &pos));
    47		KUNIT_EXPECT_EQ(test, (size_t)0, len);
    48	
    49		/*
    50		 * See above.
    51		 */
    52		len = 1234;
    53		KUNIT_EXPECT_EQ(test, 0, proc_dointvec(&null_data_table,
    54						       KUNIT_PROC_WRITE, buffer, &len,
    55						       &pos));
    56		KUNIT_EXPECT_EQ(test, (size_t)0, len);
    57	}
    58	
    59	/*
    60	 * Similar to the previous test, we create a struct ctrl_table that has a .data
    61	 * field that proc_dointvec cannot do anything with; however, this time it is
    62	 * because we tell proc_dointvec that the size is 0.
    63	 */
    64	static void sysctl_test_api_dointvec_table_maxlen_unset(struct kunit *test)
    65	{
    66		int data = 0;
    67		struct ctl_table data_maxlen_unset_table = {
    68			.procname = "foo",
    69			.data		= &data,
    70			/*
    71			 * So .data is no longer NULL, but we tell proc_dointvec its
    72			 * length is 0, so it still shouldn't try to use it.
    73			 */
    74			.maxlen		= 0,
    75			.mode		= 0644,
    76			.proc_handler	= proc_dointvec,
    77			.extra1		= &i_zero,
    78			.extra2         = &i_one_hundred,
    79		};
    80		void *buffer = kunit_kzalloc(test, sizeof(int), GFP_USER);
    81		size_t len;
    82		loff_t pos;
    83	
    84		/*
    85		 * As before, we don't care what buffer length is because proc_dointvec
    86		 * cannot do anything because its internal .data buffer has zero length.
    87		 */
    88		len = 1234;
    89		KUNIT_EXPECT_EQ(test, 0, proc_dointvec(&data_maxlen_unset_table,
    90						       KUNIT_PROC_READ, buffer, &len,
    91						       &pos));
    92		KUNIT_EXPECT_EQ(test, (size_t)0, len);
    93	
    94		/*
    95		 * See previous comment.
    96		 */
    97		len = 1234;
    98		KUNIT_EXPECT_EQ(test, 0, proc_dointvec(&data_maxlen_unset_table,
    99						       KUNIT_PROC_WRITE, buffer, &len,
   100						       &pos));
   101		KUNIT_EXPECT_EQ(test, (size_t)0, len);
   102	}
   103	
   104	/*
   105	 * Here we provide a valid struct ctl_table, but we try to read and write from
   106	 * it using a buffer of zero length, so it should still fail in a similar way as
   107	 * before.
   108	 */
   109	static void sysctl_test_api_dointvec_table_len_is_zero(struct kunit *test)
   110	{
   111		int data = 0;
   112		/* Good table. */
   113		struct ctl_table table = {
   114			.procname = "foo",
   115			.data		= &data,
   116			.maxlen		= sizeof(int),
   117			.mode		= 0644,
   118			.proc_handler	= proc_dointvec,
   119			.extra1		= &i_zero,
   120			.extra2         = &i_one_hundred,
   121		};
   122		void *buffer = kunit_kzalloc(test, sizeof(int), GFP_USER);
   123		/*
   124		 * However, now our read/write buffer has zero length.
   125		 */
   126		size_t len = 0;
   127		loff_t pos;
   128	
   129		KUNIT_EXPECT_EQ(test, 0, proc_dointvec(&table, KUNIT_PROC_READ, buffer,
   130						       &len, &pos));
   131		KUNIT_EXPECT_EQ(test, (size_t)0, len);
   132	
 > 133		KUNIT_EXPECT_EQ(test, 0, proc_dointvec(&table, KUNIT_PROC_WRITE, buffer,
   134						       &len, &pos));
   135		KUNIT_EXPECT_EQ(test, (size_t)0, len);
   136	}
   137	
   138	/*
   139	 * Test that proc_dointvec refuses to read when the file position is non-zero.
   140	 */
   141	static void sysctl_test_api_dointvec_table_read_but_position_set(
   142			struct kunit *test)
   143	{
   144		int data = 0;
   145		/* Good table. */
   146		struct ctl_table table = {
   147			.procname = "foo",
   148			.data		= &data,
   149			.maxlen		= sizeof(int),
   150			.mode		= 0644,
   151			.proc_handler	= proc_dointvec,
   152			.extra1		= &i_zero,
   153			.extra2         = &i_one_hundred,
   154		};
   155		void *buffer = kunit_kzalloc(test, sizeof(int), GFP_USER);
   156		/*
   157		 * We don't care about our buffer length because we start off with a
   158		 * non-zero file position.
   159		 */
   160		size_t len = 1234;
   161		/*
   162		 * proc_dointvec should refuse to read into the buffer since the file
   163		 * pos is non-zero.
   164		 */
   165		loff_t pos = 1;
   166	
   167		KUNIT_EXPECT_EQ(test, 0, proc_dointvec(&table, KUNIT_PROC_READ, buffer,
   168						       &len, &pos));
   169		KUNIT_EXPECT_EQ(test, (size_t)0, len);
   170	}
   171	
   172	/*
   173	 * Test that we can read a two digit number in a sufficiently size buffer.
   174	 * Nothing fancy.
   175	 */
   176	static void sysctl_test_dointvec_read_happy_single_positive(struct kunit *test)
   177	{
   178		int data = 0;
   179		/* Good table. */
   180		struct ctl_table table = {
   181			.procname = "foo",
   182			.data		= &data,
   183			.maxlen		= sizeof(int),
   184			.mode		= 0644,
   185			.proc_handler	= proc_dointvec,
   186			.extra1		= &i_zero,
   187			.extra2         = &i_one_hundred,
   188		};
   189		/* Put something in the buffer for debugging purposes. */
   190		char buf[] = "bogus";
   191		size_t len = sizeof(buf) - 1;
   192		loff_t pos = 0;
   193		/* Store 13 in the data field. */
   194		*((int *)table.data) = 13;
   195	
 > 196		KUNIT_EXPECT_EQ(test, 0, proc_dointvec(&table, KUNIT_PROC_READ, buf,
   197						       &len, &pos));
   198		KUNIT_ASSERT_EQ(test, (size_t)3, len);
   199		buf[len] = '\0';
   200		/* And we read 13 back out. */
   201		KUNIT_EXPECT_STREQ(test, "13\n", (char *)buf);
   202	}
   203	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
